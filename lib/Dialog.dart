import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'toppage.dart';
import 'SingleGtya.dart';
import 'tengacha.dart';
import 'dart:io';


Future<void> singlegachaDialog(BuildContext context,VideoPlayerController? controller, File? images) async {
  var Width = 390;
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
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () {Navigator.pop(context);},
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'キャンセル',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: Width / 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade400, //ボタンの背景色
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () {
                  runGatya.yuusyou -= 50;
                  runGatya.dainygatya = false;
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SingleGatya(movie: controller, image: images)),
                  );
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'ガチャを引く!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Width / 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          )
        ],
        content: contentContainer(
          Width / 2, Width / 1, Width / 13, Width / 27.8, Width / 10, Width, '有償ジュエルを50個使用して\nガチャを1回行います'
        ),
      );
    },
  );
}

Future<void> tengachaDialog(VideoPlayerController? controller, BuildContext context, File? images) async {
  var Width = 390;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(8),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, //ボタンの背景色
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () { Navigator.pop(context); },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'キャンセル',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: Width / 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade400, //ボタンの背景色
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () {
                  runGatya.yuusyou -= 1500;
                  Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => tengacha(movie: controller,image:images))
                  );
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'ガチャを引く!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Width / 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        content: contentContainer(
          Width/2, Width/1, Width/10, Width / 27.8, Width / 20, Width, 'ジュエルを1500個使用して\nガチャを10回行います'
        ),
      );
    },
  );
}

Future<void> dailyDialog(BuildContext context, VideoPlayerController? controller ,File? images) async {
    var Width = 390;
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
                    side: const BorderSide(color: Colors.black, width: 1)
                  ),
                  onPressed: () { Navigator.pop(context); },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'キャンセル',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: Width / 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade400, //ボタンの背景色
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  onPressed: () {
                    runGatya.yuusyou -= 150;
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SingleGatya(movie: controller,image: images)));
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'ガチャを引く!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Width / 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
          content: contentContainer(
            Width / 2, Width - 40, Width / 30, Width / 27.8, Width / 10, Width, '有償ジュエルを50個使用して\nガチャを1回行います'
          ),
        );
      },
    );
  }

Widget contentContainer(double high, wise, upper,fontbbb,upper2, int Width, String GatyaText){
  return Container(
    height: 175,
    width: 100,
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: Width / 10,
          color: Colors.green,
          width: double.infinity,
          child: const Text(
            'ガチャ確認',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: upper),
          child: Text(
            GatyaText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontbbb),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: upper2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text('所持')),
              Text(runGatya.yuusyou.toString()),
            ],
          ),
        ),
      ],
    )
  );
}