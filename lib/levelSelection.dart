import 'package:flutter/material.dart';
import 'easymod.dart';
import 'impossiblemod.dart';
import 'mediummod.dart';
import 'commingsoon.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import './naviagtionanim.dart';

class LevelSelection extends StatefulWidget {
  @override
  bool val;
  LevelSelection({this.val});
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LevelSelection2(val: val);
  }
}

class LevelSelection2 extends State<LevelSelection> {
  @override
  bool val;
  LevelSelection2({this.val});
  var col = Color(0xFF091921);
  var shad = Colors.black26; //black12
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: val == true ? col : col2,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(15),
              height: 60,
              width: double.infinity,
              child: Text(
                'Select Difficulty',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: val == true ? Colors.white : colfortext,
                    letterSpacing: 1.5,
                    fontSize: 25,
                    decoration: TextDecoration.none),
              ),
              decoration: val == true ? styleforme : styleforme2,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              height: 260,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Image(
                image: val == true
                    ? AssetImage('images/human2.png')
                    : AssetImage('images/human.png'),
              ),
              decoration: val == true ? styleforme : styleforme2,
            ),
            GestureDetector(
              onTap: () {
                player.play('buttonpress.wav');
                Navigator.push(
                    context,
                    EnterExitRoute(
                        exitPage: LevelSelection(
                          val: val,
                        ),
                        enterPage: EasyMode(
                          val: val,
                        )));
              },
              child: Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 80,
                          child: Image(
                            image: AssetImage('images/easy.png'),
                          ),
                          decoration: val == true ? styleforme : styleforme2),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          'Easy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: val == true ? Colors.white : colfortext,
                            letterSpacing: 1.5,
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: val == true ? styleforme : styleforme2),
            ),
            GestureDetector(
              onTap: () {
                player.play('buttonpress.wav');
                Navigator.push(
                    context,
                    EnterExitRoute(
                        exitPage: LevelSelection(
                          val: val,
                        ),
                        enterPage: Mediummode(
                          val: val,
                        )));
              },
              child: Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 80,
                          child: Image(
                            image: AssetImage('images/hard.png'),
                          ),
                          decoration: val == true ? styleforme : styleforme2),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          'Medium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: val == true ? Colors.white : colfortext,
                            letterSpacing: 1.5,
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: val == true ? styleforme : styleforme2),
            ),
            GestureDetector(
              onTap: () {
                player.play('buttonpress.wav');

                Navigator.push(
                    context,
                    EnterExitRoute(
                        exitPage: LevelSelection(
                          val: val,
                        ),
                        enterPage: Impossible(
                          val: val,
                        )));
              },
              child: Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 80,
                          child: Image(
                            image: AssetImage('images/medium.png'),
                          ),
                          decoration: val == true ? styleforme : styleforme2),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          'Impossible',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: val == true ? Colors.white : colfortext,
                            letterSpacing: 1.5,
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: val == true ? styleforme : styleforme2),
            ),
            Text(
              'Design And Developed by Dev_Negative',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: val == false ? colfortext : Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  fontFamily: 'Quicksand'),
            ),
          ],
        ),
      ),
    );
  }
}
