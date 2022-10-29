import 'package:flutter/material.dart';
import 'Gatyascreen.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'Gatyarun.dart';

class SingleGatya extends StatefulWidget {
  @override
  _SingleGatya createState() => _SingleGatya();
}

class _SingleGatya extends State<SingleGatya> {
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

    Future.delayed(Duration(seconds: 32), () {
      setState(() {
        _video = false;
      });
    });

    return Stack(children: <Widget>[
      (_video)
          ? Stack(
              children: [
                Container(
                  width: Widht,
                  height: Height,
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: Height / 1.15, left: Widht / 1.25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        _video = false;
                      });
                    },
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              ],
            )
          : Column(children: [
              Container(
                height: Widht / 13,
                width: Widht / 1,
                decoration: BoxDecoration(
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
                margin:
                    EdgeInsets.only(top: Height / 6, left: Widht / Widht / 13),
                child: Center(
                  child: Text(
                    'ガチャ結果',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Widht / 2.5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [printimage()]),
              ),
              Container(
                margin: EdgeInsets.only(top: Widht / 2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => runGatya(
                                          movie: _videoPlayerController,
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Container(
                              height: Widht / 8,
                              width: Widht / 3.5,
                              child: Center(
                                child: Text(
                                  '戻る',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown,
                                      fontSize: 20),
                                ),
                              ))),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              runGatya.yuusyou -= 1500;
                            });
                            Dialogcome2();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade400,
                          ),
                          child: Container(
                              height: Widht / 8,
                              width: Widht / 3.5,
                              child: Center(
                                child: Text(
                                  'もう一度引く',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )))
                    ]),
              )
            ])
    ]);
  }

  Widget printimage() {
    var Height = 780;
    var Widht = 390;
    return Column(
      children: [
        Container(
          height: Widht / 6,
          width: Widht / 4,
          color: Colors.red,
          child: Image(
            image: AssetImage('assets/images/ios-1.jpg'),
          ),
        ),
        Container(
          width: Widht / 5,
          child: Stack(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Positioned(
                left: 15,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              Positioned(
                left: 30,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              Positioned(
                left: 45,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 60,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> Dialogcome2() async {
    var Height = 780;
    var Widht = 390;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              insetPadding: EdgeInsets.all(8),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, //ボタンの背景色
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => runGatya(
                                      movie: _videoPlayerController,
                                    )));
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'キャンセル',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400, //ボタンの背景色
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        setState(() {
                          runGatya.yuusyou -= 150;
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleGatya()));
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'ガチャを引く!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
              content: Container(
                height: Widht / 2,
                width: Widht / 1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Widht / 10,
                      color: Colors.green,
                      width: double.infinity,
                      child: Text('ガチャ確認',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Widht / 5),
                      child: Text(
                        'ガチャを行います',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
