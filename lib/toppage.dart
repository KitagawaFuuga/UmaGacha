import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'tengacha.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'SingleGtya.dart';
import 'Dialog.dart';
import 'dart:io';

class runGatya extends StatefulWidget {
  File? image;
  late VideoPlayerController? movie;
  runGatya({Key? key, required this.movie,this.image}) : super(key: key);

  @override
  _runGatya createState() => _runGatya();
  static var yuusyou = 1000000;
  static var musyou = 1000000;
  static bool dainygatya = true;
}

class _runGatya extends State<runGatya> {
  VideoPlayerController? _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = widget.movie;
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      aspectRatio: 1 / 2,
      autoPlay: true,
      looping: true,
      showControls: false,
      placeholder: Container(color: Colors.black),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Height = MediaQuery.of(context).size.height;
    var Widht = MediaQuery.of(context).size.width;
    Color dainyColor = Colors.amber.shade700;
    dainyColor = Colors.amber.shade700;
    return Stack(
      children: <Widget>[
        Container(
          width: Widht / 1,
          height: Height / 1,
          child: AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            // 動画を表示
            child: Chewie(controller: _chewieController),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: Widht / 20),
          height: Widht / 16,
          width: Widht / 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Colors.pink.withOpacity(1),
                Colors.yellow.withOpacity(0.8),
              ],
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: Widht / 20),
            child: Text(
              'ガチャ',
              style: TextStyle(color: Colors.white, fontSize: Widht / 20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Widht / 20, left: Widht / 2.2),
          color: Colors.white,
          height: Widht / 25,
          width: Widht / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: Widht / 8),
                child: Text(
                  runGatya.yuusyou.toString(),
                  style: TextStyle(fontSize: Widht / 39, color: Colors.brown),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Widht / 20),
                child: Text(
                  runGatya.musyou.toString(),
                  style: TextStyle(fontSize: Widht / 39, color: Colors.brown),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: Widht / 2.3, top: Widht / 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Widht / 5,
                height: Widht / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Widht / 25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'ガチャ詳細',
                    style: TextStyle(fontSize: Widht / 48.75, color: Colors.brown)
                  ),
                ),
              ),
              SizedBox(
                width: Widht / 3.9,
                height: Widht / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Widht / 25)),
                  ),
                  onPressed: () {},
                  child: Text(
                    '育成ウマ娘詳細',
                    style: TextStyle(fontSize: Widht / 43, color: Colors.brown),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Widht + 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i <= 2; i++)
                Container(
                  color: Colors.blue,
                  height: Widht / 8,
                  width: Widht / 5,
                  child: Image.asset('assets/images/public.jpg',fit: BoxFit.cover),
                ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Widht + 30),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: Widht / 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: Widht / 5,
                      color: Colors.white,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: Widht / 6,
                          width: Widht / 2,
                          child: Image.file(widget.image!,fit: BoxFit.cover),
                        ),
                        Text('aaaaaaa',style: TextStyle(fontSize: 12))
                      ]
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: Widht / 5,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  'ピックアップ育成ウマ娘のおまけピースは90個!',
                  style: TextStyle(fontSize: Widht / 39, color: Colors.yellow),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  runGatya.dainygatya
                  ? Column(
                    children: [
                      Bubble(
                        margin: BubbleEdges.only( bottom: 10),
                        padding: BubbleEdges.only(left: Widht / 25, right: Widht / 25,),
                        child: Text(
                          '毎日５時にリセット',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: Widht / 39.0, color: Colors.brown),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {singlegachaDialog(context,_videoPlayerController,widget.image);},
                          style: ElevatedButton.styleFrom(primary: dainyColor),
                          child: gotobotton(Widht / 4.3, Widht / 6,Widht / 3.9, '1日1回限定',"50")
                        ),
                      )
                    ],
                  )
                  : Column(
                    children: [
                      Bubble(
                        margin: const BubbleEdges.only( bottom: 10),
                        padding: BubbleEdges.only(left: Widht / 25, right: Widht / 25,),
                        child: Text(
                          '毎日５時にリセット',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: Widht / 39.0, color: Colors.brown),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: dainyColor),
                        child: Stack(
                          children: [
                            Container(
                              width: Widht / 4.3,
                              height: Widht / 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    '1日1回限定',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: Widht / 3.9,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.amber.shade700),
                                      color: Colors.amber.shade900,
                                      borderRadius:BorderRadius.circular(25)
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(right: Widht / 39),
                                      child: const Text("50", textAlign: TextAlign.right),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              child: Container(
                                width: Widht / 4.3,
                                height: Widht / 6,
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    '本日分\n利用ずみ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: Widht / 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Widht / 12),
                    child: ElevatedButton(
                      onPressed: () { tengachaDialog(_videoPlayerController,context,widget.image); },
                      style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
                      child: gotobotton(Widht / 4.3, Widht / 6, Widht / 3.9,  '10連引き!',"1500")
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Widht / 12),
                    child: ElevatedButton(
                      onPressed: () { dailyDialog(context,_videoPlayerController,widget.image); },
                      style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
                      child: gotobotton(Widht / 4.3, Widht / 6, Widht / 3.9,  '1回引く!',"150")
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: Widht / 8),
                alignment: Alignment.bottomCenter,
                height: Widht / 8,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      bottomButton(2, 'キャラ', Widht / 32.5),
                      bottomButton(2, 'ギャラリー', Widht / 55),
                      bottomButton(3, 'ホーム', Widht / 32.5),
                      bottomButton(2, 'レース', Widht / 32.5),
                      bottomButton(2, 'ガチャ', Widht / 32.5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget bottomButton(int flex, String text, double fontsize){
  return Expanded(
    flex: flex,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {},
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontsize,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}

Widget gotobotton(double Widht, Heigth, Widht2, String tex, num){
  return Container(
    alignment: Alignment.center,
    width: Widht,
    height: Heigth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          tex,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: Widht2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade400),
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            margin: EdgeInsets.only(right: Widht / 39),
            child: Text(num, textAlign: TextAlign.right),
          ),
        ),
      ],
    ),
  );
}