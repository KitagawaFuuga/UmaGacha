import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart ';
import 'package:video_player/video_player.dart';
import 'tengacha.dart';
import 'toppage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController? _videoPlayerController;
  File? _video;
  File? _image;
  final ImagePicker picker = ImagePicker();
  bool ones = false;
  bool imagechange = false;
  bool videochange = false;

  Future screenchange(VideoPlayerController? getVideo) async {
    if(imagechange && videochange){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => runGatya(movie: getVideo,image: _image)),
      );
    }
  }

  Future _getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);

    setState(() {
      videochange = true;
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_video!);
        screenchange(this._videoPlayerController);
      } else {
        print('No video selected.');
      }
    });
  }

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      imagechange = true;
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        screenchange(_videoPlayerController);
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('動画と写真を選択してください'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10,top: 30),
                  height: deviceheight * 0.08,
                  width: devicewidth * 0.4,
                  child: ElevatedButton(
                    onPressed: () => {
                      _getVideo(),
                    },
                    style: ElevatedButton.styleFrom(
                      primary: videochange ? Colors.red : Colors.blue                    
                    ),
                    child: Text('ビデオ選択'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10,top: 30),
                  height: deviceheight * 0.08,
                  width: devicewidth * 0.4,
                  child: ElevatedButton(
                    onPressed: () => {
                      _getImage(),
                    },
                    style: ElevatedButton.styleFrom(
                      primary: imagechange ? Colors.red : Colors.blue
                    ),
                    child: Text('写真選択'),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}