import 'package:flutter/material.dart';
import 'Gatyascreen.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';

class Rungatya extends StatefulWidget {
  @override
  _Rungatya createState() => _Rungatya();
}

class _Rungatya extends State<Rungatya> {
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

    Future.delayed(Duration(seconds: 20), () {
      setState(() {
        _video = false;
      });
    });

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
            : Column(
                children: [
                  Container(
                    height: Widht/13,
                    width: Widht,
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
                    margin: EdgeInsets.only(top: Height / 6, left: Widht / Widht/13),
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
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [printimage(), printimage(), printimage()]),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [printimage(), printimage()],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          printimage(),
                          printimage(),
                          printimage(),
                        ]),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            printimage(),
                            printimage(),
                          ])),
                  Container(
                    margin: EdgeInsets.only(top: Widht/13),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => runGatya()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: Container(
                                  height: Widht/8,
                                  width: Widht/3,
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
                                  height: Widht/8,
                                  width: Widht/3,
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
          height: Widht /5.5,
          width: Height /8.5,
          color: Colors.red,
          child: Image(
            image: AssetImage('assets/images/ios-1.jpg'),
          ),
        ),
        Container(
          width: Widht /5,
          child: Stack(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              for(int i = 15; i <= 60; i += 15)
                runIcon(i.toDouble())
            ],
          ),
        ),
      ],
    );
  }

  Widget runIcon(double i) {
    Color color;
    if(i <= 45){
      color = Colors.yellow;
    }else{
      color = Colors.white;
    }
    return Positioned(
      left: i,
      child: Icon(
        Icons.star,
        color: color,
      ),
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
                                builder: (context) => runGatya()));
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
                          runGatya.yuusyou -= 1500;
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rungatya()));
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
                height: Widht /2,
                width: Widht/1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      color: Colors.green,
                      width: double.infinity,
                      child: Text('ガチャ確認',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'ジュエルを1500個使用して\nガチャを10回行います',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('所持'),
                            ),
                            Text(runGatya.yuusyou.toString()),
                          ],
                        )),
                    Icon(Icons.arrow_downward),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('所持'),
                        ),
                        Text('${runGatya.yuusyou - 1500}'),
                      ],
                    ))
                  ],
                ),
              ));
        });
  }
}
