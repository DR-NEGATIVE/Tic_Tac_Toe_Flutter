import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './levelSelection.dart';
import './multiplayer.dart';
import 'commingsoon.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import './naviagtionanim.dart';
import 'package:share/share.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homePage();
  }
}

class _homePage extends State<HomePage> {
  var col = Color(0xFF091921);
  var shad = Colors.black26; //black12
  bool changeColor =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? false
          : true;
  var col2 = Colors.grey[300];
  var shad2 = Colors.black12;
  var colfortext = Colors.grey[700];
  AudioCache player;
  void initState() {
    super.initState();
    player = AudioCache(
        prefix: "assets/",
        fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY)
          ..setReleaseMode(ReleaseMode.STOP));
  }

  var styleforme = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        offset: Offset(4.0, 4.0),
        blurRadius: 3.0,
        spreadRadius: 0.5),
    BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.05),
        offset: Offset(-3.0, -3.0),
        blurRadius: 3.0,
        spreadRadius: 0.5)
  ], color: Color(0xFF091921), borderRadius: BorderRadius.circular(20));
  var styleforme2 = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.grey[500],
        offset: Offset(4.0, 4.0),
        blurRadius: 5.0,
        spreadRadius: 0.5),
    BoxShadow(
        color: Colors.white,
        offset: Offset(-4.0, -4.0),
        blurRadius: 5.0,
        spreadRadius: 0.5)
  ], color: Colors.grey[300], borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: changeColor == false ? col : col2,
      child: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            color: changeColor == false ? col : col2,
            child: FittedBox(
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (changeColor == false) {
                        setState(() {
                          changeColor = true;
                        });
                      } else {
                        setState(() {
                          changeColor = false;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 60,
                      height: 60,
                      child: Icon(
                        changeColor == true
                            ? Icons.brightness_5_outlined
                            : Icons.brightness_4_outlined,
                        size: 30,
                        textDirection: TextDirection.ltr,
                        color: changeColor == false ? Colors.white : colfortext,
                      ),
                      decoration:
                          changeColor == false ? styleforme : styleforme2,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 12),
                      height: 60,
                      child: Text(
                        'TIC TAC TOE',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            decoration: TextDecoration.none,
                            color: changeColor == false
                                ? Colors.white
                                : colfortext,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                      ),
                      decoration:
                          changeColor == false ? styleforme : styleforme2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                          ' Hey Checkout This Game :  https://play.google.com/store/apps/details?id=com.dev_negative.Tic_Tac_Toe',
                          subject: 'DEVELOPER COLLECTION');
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.share,
                        size: 30,
                        textDirection: TextDirection.ltr,
                        color: changeColor == false ? Colors.white : colfortext,
                      ),
                      decoration:
                          changeColor == false ? styleforme : styleforme2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(25),
                height: 280,
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Image(
                  image: changeColor == false
                      ? AssetImage('images/games.png')
                      : AssetImage('images/ok.png'),
                ),
                decoration: changeColor == false ? styleforme : styleforme2,
              ),
              GestureDetector(
                onTap: () {
                  player.play('buttonpress.wav');
                  Navigator.push(context,
                      SlideRightRoute(page: LevelSelection(val: !changeColor)));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  textDirection: TextDirection.ltr,
                                  size: 40,
                                  color: changeColor == false
                                      ? Colors.white
                                      : colfortext,
                                ),
                              ),
                              Container(
                                child: new Text(
                                  'Play With AI',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    decoration: TextDecoration.none,
                                    fontSize: 25,
                                    letterSpacing: 1.0,
                                    color: changeColor == false
                                        ? Colors.white
                                        : colfortext,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: changeColor == false ? styleforme : styleforme2,
                ),
              ),
              GestureDetector(
                onTap: () {
                  player.play('buttonpress.wav');

                  Navigator.push(context,
                      SlideRightRoute(page: Multiplayer(val: !changeColor)));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.group,
                            textDirection: TextDirection.ltr,
                            size: 40,
                            color: changeColor == false
                                ? Colors.white
                                : colfortext,
                          ),
                        ),
                        Container(
                          child: new Text(
                            'Multiplayer',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                decoration: TextDecoration.none,
                                fontSize: 25,
                                letterSpacing: 1.0,
                                color: changeColor == false
                                    ? Colors.white
                                    : colfortext),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: changeColor == false ? styleforme : styleforme2,
                ),
              ),
              GestureDetector(
                onTap: () {
                  player.play('buttonpress.wav');

                  Navigator.push(context,
                      SlideRightRoute(page: commingsoon(val: changeColor)));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.bluetooth,
                                  textDirection: TextDirection.ltr,
                                  size: 40,
                                  color: changeColor == false
                                      ? Colors.white
                                      : colfortext,
                                ),
                              ),
                              Container(
                                child: new Text(
                                  'Local MultiPlayer',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    decoration: TextDecoration.none,
                                    fontSize: 25,
                                    letterSpacing: 1.0,
                                    color: changeColor == false
                                        ? Colors.white
                                        : colfortext,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: changeColor == false ? styleforme : styleforme2,
                ),
              ),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  height: 60,
                  width: double.infinity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.exit_to_app,
                            textDirection: TextDirection.ltr,
                            size: 40,
                            color: changeColor == false
                                ? Colors.white
                                : colfortext,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 60),
                          child: new Text(
                            'Exit',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              letterSpacing: 1.5,
                              color: changeColor == false
                                  ? Colors.white
                                  : colfortext,
                            ),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: changeColor == false ? styleforme : styleforme2,
                ),
              ),
              Text(
                'Design And Developed by Dev_Negative',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: changeColor == true ? colfortext : Colors.white,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    fontFamily: 'Quicksand'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
