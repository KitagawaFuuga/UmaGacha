import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart ';
import 'package:video_player/video_player.dart';
import 'Gatyarun.dart';
import 'Gatyascreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController? _videoPlayerController;
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _videoPlayerController == null
            ? Text('No image selected.')
            : AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                // 動画を表示
                child: VideoPlayer(_videoPlayerController!),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => runGatya(movie: _videoPlayerController!),
            ),
          );
        },
        child: Icon(Icons.image),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Get Move'),
//       ),
//       body: Center(
//         child: _image == null ? Text('No image selected.') : Text(_image!.path),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }

