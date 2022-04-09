import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'Gatyarun.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'SingleGtya.dart';

class runGatya extends StatefulWidget {
  @override
  _runGatya createState() => _runGatya();
  static var yuusyou = 1000000;
  static var musyou = 1000000;
  static bool dainygatya = true;
}

class _runGatya extends State<runGatya> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/runshoat.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1 / 2,
      autoPlay: true,
      looping: true,
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
    Color dainyColor = Colors.amber.shade700;
    dainyColor = Colors.amber.shade700;
    return Stack(
      children: <Widget>[
        Container(
          width: Widht /1,
          height: Height / 1,
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            // 動画を表示
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: Widht/20),
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
            margin: EdgeInsets.only(left: Widht/20),
            child: Text(
              'ガチャ',
              style: TextStyle(color: Colors.white, fontSize: Widht/20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Widht/20, left: Widht / 2.2),
          color: Colors.white,
          height: Widht/25,
          width: Widht/2,
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
                  margin: EdgeInsets.only(left: Widht/20),
                  child: Text(runGatya.musyou.toString(),
                      style: TextStyle(fontSize: Widht / 39, color: Colors.brown))),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: Widht/2.3, top: Widht/8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Widht/5,
                height: Widht / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Widht/25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'ガチャ詳細',
                    style: TextStyle(fontSize: Widht / 48.75, color: Colors.brown),
                  ),
                ),
              ),
              SizedBox(
                width: Widht / 3.9,
                height: Widht / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Widht/25),
                    ),
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
          margin: EdgeInsets.only(top: Widht + 50 ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for(int i = 0; i <=2; i++)
            Container(
              color: Colors.blue,
              height: Widht /8,
              width: Widht / 5,
            ),
          ]),
        ),
        Container(
          margin:  EdgeInsets.only(top: Widht + 30),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: Widht /9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: Widht/5,
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.blue,
                      height: Widht / 6,
                      width: Widht/2,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: Widht/5,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(5),
                  child:  Text('ピックアップ育成ウマ娘のおまけピースは90個!',
                      style: TextStyle(fontSize: Widht / 39, color: Colors.yellow))),
              Bubble(
                margin: BubbleEdges.fromLTRB(5, 5, 260, 5),
                padding: BubbleEdges.only(left: Widht/25, right: Widht/25),
                child: Text(
                  '毎日５時にリセット',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Widht / 39.0, color: Colors.brown),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  runGatya.dainygatya
                      ? ElevatedButton(
                          onPressed: () {
                            Dialogcome();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: dainyColor, //ボタンの背景色
                          ),
                          child: Container(
                            width: Widht / 4.3,
                            height: Widht / 6,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '1日1回限定',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: Widht / 3.9,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber.shade700),
                                      color: Colors.amber.shade900,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(right: Widht / 39),
                                      child: const Text(
                                        "50",
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      : 
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: dainyColor, //ボタンの背景色
                          ),
                          child: Stack(children: [
                            Container(
                              width: Widht / 4.3,
                              height: Widht / 6,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '1日1回限定',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: Widht / 3.9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.amber.shade700),
                                        color: Colors.amber.shade900,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(right: Widht / 39),
                                        child: const Text(
                                          "50",
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                  ]),
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
                                  style: TextStyle(fontSize: Widht/20),
                                )),
                              ),
                            )
                          ])),
                  ElevatedButton(
                    onPressed: () {
                      Dialogcome3();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade400, //ボタンの背景色
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: Widht / 4.3,
                      height: Widht / 6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '1回引く!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: Widht / 3.9,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade400),
                                color: Colors.green.shade800,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: Widht / 39),
                                child: const Text(
                                  "150",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Dialogcome2();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade400, //ボタンの背景色
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: Widht / 4.3,
                      height: Widht / 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('10回引く!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            width: Widht / 3.9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade400),
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: Widht / 39),
                              child: const Text(
                                "1500",
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //ボタンの背景色
                            ),
                            onPressed: () {},
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                child: Text('キャラ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Widht / 32.5,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //ボタンの背景色
                            ),
                            onPressed: () {},
                            child: Container(
                                width: double.infinity,
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'ギャラリー',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Widht / 55,
                                      fontWeight: FontWeight.bold),
                                )),
                          )),
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //ボタンの背景色
                            ),
                            onPressed: () {},
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text('ホーム',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Widht / 32.5,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, //ボタンの背景色
                            ),
                            onPressed: () {},
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text('レース',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Widht / 32.5,
                                        fontWeight: FontWeight.bold)))),
                      ),
                      Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade400, //ボタンの背景色
                            ),
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'ガチャ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Widht / 32.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ]),
              ),)
            ],
          ),
        ),
      ],
    );
  }
  
    Future<void> Dialogcome() async {
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
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'キャンセル',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400, //ボタンの背景色
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        runGatya.yuusyou -= 50;
                        setState(() {
                          runGatya.dainygatya = false;
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
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
              content: Container(
                height: Width/2,
                width: Width/1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Width / 10,
                      color: Colors.green,
                      width: double.infinity,
                      child: Text('ガチャ確認',
                          style: TextStyle(
                              fontSize: Width /  21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Width / 13),
                      child: Text(
                        '有償ジュエルを50個使用して\nガチャを1回行います',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Width /  27.8),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: Width / 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('所持'),
                            ),
                            Text(runGatya.yuusyou.toString()),
                          ],
                        ))
                  ],
                ),
              ));
        });
  }

  Future<void> Dialogcome3() async {
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
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'キャンセル',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400, //ボタンの背景色
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        runGatya.yuusyou -= 150;
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
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
              content: Container(
                height: Width/2,
                width: Width - 40,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Width / 10,
                      color: Colors.green,
                      width: double.infinity,
                      child: Text('ガチャ確認',
                          style: TextStyle(
                              fontSize: Width /  21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Width / 30),
                      child: Text(
                        '有償ジュエルを50個使用して\nガチャを1回行います',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Width /  27.8),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: Width / 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text('所持'),
                            ),
                            Text(runGatya.yuusyou.toString()),
                          ],
                        ))
                  ],
                ),
              ));
        });
  }

  Future<void> Dialogcome2() async {
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
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'キャンセル',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400, //ボタンの背景色
                          side: BorderSide(color: Colors.black, width: 1)),
                      onPressed: () {
                        runGatya.yuusyou -= 1500;
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
                              fontSize: Width/24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
              content: Container(
                height: Width/2.0,
                width: Width/1,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Width / 10,
                      color: Colors.green,
                      width: double.infinity,
                      child: Text('ガチャ確認',
                          style: TextStyle(
                              fontSize: Width /  21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Width/ 39),
                      child: Text(
                        'ジュエルを1500個使用して\nガチャを10回行います',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Width /  27.8),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: Width/20),
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
