import 'package:flutter/material.dart';
import 'toppage.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'Dialog.dart';
import 'dart:io';

class tengacha extends StatefulWidget {
  VideoPlayerController? movie;
  File? image;
  tengacha({Key? key, required this.movie,required this.image}) : super(key: key);

  @override
  _tengacha createState() => _tengacha();
}

class _tengacha extends State<tengacha> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _video = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/mkmi.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1 / 2,
      autoPlay: true,
      looping: false,
      showControls: false,
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Widht = MediaQuery.of(context).size.width;

    Future.delayed(
        const Duration(seconds: 32),() {
        setState(() {_video = false;});
      }
    );

    return Stack(
      children: <Widget>[
        (_video)
        ? Stack(
          children: [
            Container(
              width: Widht,
              height: Height,
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Chewie(controller: _chewieController),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Height / 1.15, left: Widht / 1.25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {
                  setState(() { _video = false; });
                },
                child: const Icon(Icons.arrow_right),
              ),
            ),
          ],
        )
        : Column(
          children: [
            Container(
              height: Widht / 13,
              width: Widht,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    spreadRadius: 5,
                    blurRadius: 1,
                    offset: Offset(-1, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: Height / 6, left: Widht / Widht / 13),
              child: const Center(
                child: Text(
                  'ガチャ結果',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [printimage(), printimage(), printimage()]
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [printimage(), printimage()],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  printimage(),
                  printimage(),
                  printimage(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  printimage(),
                  printimage(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Widht / 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _videoPlayerController = widget.movie!;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => runGatya(movie: _videoPlayerController,image: widget.image)),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Container(
                      height: Widht / 8,
                      width: Widht / 3,
                      child: const Center(
                        child: Text(
                          '戻る',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        runGatya.yuusyou -= 1500;
                        _videoPlayerController = widget.movie!;
                      });
                      tengachaDialog(_videoPlayerController, context, widget.image!);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
                    child: Container(
                      height: Widht / 8,
                      width: Widht / 3,
                      child: const Center(
                        child: Text(
                          'もう一度引く',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget printimage() {
    var Height = 780;
    var Widht = 390;
    return Column(
      children: [
        Container(
          height: Widht / 5.5,
          width: Height / 8.5,
          color: Colors.red,
          child: Image.file(widget.image!,fit: BoxFit.cover),
        ),
        Container(
          width: Widht / 5,
          child: Stack(
            children: [
              const Icon(Icons.star,color: Colors.yellow),
              for (int i = 0; i <= 60; i += 15) runIcon(i.toDouble())
            ],
          ),
        ),
      ],
    );
  }

  Widget runIcon(double i) {
    Color color;
    if (i <= 30) {
      color = Colors.yellow;
    } else {
      color = Colors.white;
    }
    return Positioned(
      left: i,
      child: Icon(Icons.star,color: color),
    );
  }
}
