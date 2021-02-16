import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Multiplayer extends StatefulWidget {
  bool val;
  Multiplayer({this.val});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _multiplayer(val: val);
  }
}

class _multiplayer extends State<Multiplayer> {
  bool val;

  _multiplayer({this.val});
  AudioCache player;
  void initState() {
    super.initState();
    player = AudioCache(
        prefix: "assets/",
        fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY)
          ..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  bool temp = true;
  bool turn = true;
  int x = 0, y = 0;
  var col = Color(0xFF091921);
  var shad = Colors.black26; //black12
  var col2 = Colors.grey[300];
  var shad2 = Colors.black12;
  var colfortext = Colors.grey[700];
  var playerinput = ["", "", "", "", "", "", "", "", ""];
  bool a1 = true;
  bool a2 = true;
  bool a3 = true;
  bool a4 = true;
  bool a5 = true, a6 = true, a7 = true, a8 = true, a9 = true;
  bool c1 = true;
  bool lock = false;
  bool c2 = true,
      c3 = true,
      c4 = true,
      c5 = true,
      c6 = true,
      c7 = true,
      c8 = true,
      c9 = true;
  _showDialog(String val2) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: val == false
                              ? (val2 == 'X'
                                  ? AssetImage('images/closeday.png')
                                  : AssetImage('images/oday.png'))
                              : (val2 == 'X'
                                  ? AssetImage('images/close.png')
                                  : AssetImage('images/o.png')),
                          height: 35,
                          width: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          'Wins',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: val == false ? colfortext : Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: val == false ? colfortext : Colors.white,
                            fontFamily: 'QuickSand',
                            fontSize: 25,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none),
                      ),
                      decoration: val == true ? styleforme : styleforme2,
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: val == true ? col : col2,
          );
        });
  }

  greenverify() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
          color: val == false ? Colors.grey[500] : Color.fromRGBO(0, 0, 0, 0.3),
          offset: Offset(4.0, 4.0),
          blurRadius: 5.0,
          spreadRadius: 0.5),
      BoxShadow(
          color:
              val == false ? Colors.white : Color.fromRGBO(255, 255, 255, 0.05),
          offset: Offset(-4.0, -4.0),
          blurRadius: 5.0,
          spreadRadius: 0.5)
    ], color: Colors.green[100], borderRadius: BorderRadius.circular(20));
  }

  makeitreset() {
    setState(() {
      playerinput = ["", "", "", "", "", "", "", "", ""];
      turn = true;
      lock = false;
      a1 = true;
      a2 = true;
      a3 = true;
      a4 = true;
      a5 = true;
      a6 = true;
      a7 = true;
      a8 = true;
      a9 = true;
      c1 = true;
      c2 = true;
      c3 = true;
      c4 = true;
      c5 = true;
      c6 = true;
      c7 = true;
      c8 = true;
      c9 = true;
    });
  }

  // checkwhowin() {
  //   player.play('newtap.wav');
  //   String p1 = playerinput[0],
  //       p2 = playerinput[1],
  //       p3 = playerinput[2],
  //       p4 = playerinput[3],
  //       p5 = playerinput[4],
  //       p6 = playerinput[5],
  //       p7 = playerinput[6],
  //       p8 = playerinput[7],
  //       p9 = playerinput[8];
  //   if ((p1 == 'X' && p2 == 'X' && p3 == 'X') ||
  //       (p1 == 'O' && p2 == 'O' && p3 == 'O')) {
  //     if ((p1 == 'X' && p2 == 'X' && p3 == 'X')) {
  //       _showDialog('X');
  //       print('x wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print('O wins');
  //       y++;
  //     }
  //     player.play('Winsound.wav');
  //     makeitreset();
  //   } else if ((p1 == 'X' && p4 == 'X' && p7 == 'X') ||
  //       (p1 == 'O' && p4 == 'O' && p7 == 'O')) {
  //     if ((p1 == 'X' && p4 == 'X' && p7 == 'X')) {
  //       _showDialog('X');

  //       print('X wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print('O wins');
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p4 == 'X' && p5 == 'X' && p6 == 'X') ||
  //       (p4 == 'O' && p5 == 'O' && p6 == 'O')) {
  //     if ((p4 == 'X' && p5 == 'X' && p6 == 'X')) {
  //       _showDialog('X');

  //       print('X wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print('O wins');
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p7 == 'X' && p8 == 'X' && p9 == 'X') ||
  //       (p7 == 'O' && p8 == 'O' && p9 == 'O')) {
  //     if ((p7 == 'X' && p8 == 'X' && p9 == 'X')) {
  //       _showDialog('X');

  //       print('X wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print("O wins");
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p2 == 'X' && p5 == 'X' && p8 == 'X') ||
  //       (p2 == 'O' && p5 == 'O' && p8 == 'O')) {
  //     if ((p2 == 'X' && p5 == 'X' && p8 == 'X')) {
  //       _showDialog('X');

  //       print('X wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print("O wins");
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p3 == 'X' && p6 == 'X' && p9 == 'X') ||
  //       (p3 == 'O' && p6 == 'O' && p9 == 'O')) {
  //     if ((p3 == 'X' && p6 == 'X' && p9 == 'X')) {
  //       _showDialog('X');

  //       print("x wins");
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print("O wins");
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p1 == 'X' && p5 == 'X' && p9 == 'X') ||
  //       (p1 == 'O' && p5 == 'O' && p9 == 'O')) {
  //     if ((p1 == 'X' && p5 == 'X' && p9 == 'X')) {
  //       _showDialog('X');

  //       print('X wins');
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print('O wins');
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   } else if ((p3 == 'X' && p5 == 'X' && p7 == 'X') ||
  //       (p3 == 'O' && p5 == 'O' && p7 == 'O')) {
  //     if ((p3 == 'X' && p5 == 'X' && p7 == 'X')) {
  //       _showDialog('X');

  //       print("X wins");
  //       x++;
  //     } else {
  //       _showDialog('O');

  //       print("O wins");
  //       y++;
  //     }
  //     player.play('Winsound.wav');

  //     makeitreset();
  //   }
  // }
  showtiedialog(String val2) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: val == false
                              ? (val2 == 'X'
                                  ? AssetImage('images/closeday.png')
                                  : AssetImage('images/oday.png'))
                              : (val2 == 'X'
                                  ? AssetImage('images/close.png')
                                  : AssetImage('images/o.png')),
                          height: 35,
                          width: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          'Tie',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: val == false ? colfortext : Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Image(
                          image: val == false
                              ? (val2 != 'X'
                                  ? AssetImage('images/closeday.png')
                                  : AssetImage('images/oday.png'))
                              : (val2 != 'X'
                                  ? AssetImage('images/close.png')
                                  : AssetImage('images/o.png')),
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: val == false ? colfortext : Colors.white,
                            fontFamily: 'QuickSand',
                            fontSize: 25,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none),
                      ),
                      decoration: val == true ? styleforme : styleforme2,
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: val == true ? col : col2,
          );
        });
  }

  checkwhowin() {
    player.play('newtap.wav');

    String p1 = playerinput[0],
        p2 = playerinput[1],
        p3 = playerinput[2],
        p4 = playerinput[3],
        p5 = playerinput[4],
        p6 = playerinput[5],
        p7 = playerinput[6],
        p8 = playerinput[7],
        p9 = playerinput[8];
    if ((p1 == 'X' && p2 == 'X' && p3 == 'X') ||
        (p1 == 'O' && p2 == 'O' && p3 == 'O')) {
      String ans = "";
      if ((p1 == 'X' && p2 == 'X' && p3 == 'X')) {
        ans = "X";
        print('x wins');
        x++;
      } else {
        ans = "O";

        print('O wins');
        y++;
      }
      setState(() {
        c1 = false;
        c2 = false;
        c3 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });

      return;
    } else if ((p1 == 'X' && p4 == 'X' && p7 == 'X') ||
        (p1 == 'O' && p4 == 'O' && p7 == 'O')) {
      String ans = "";
      if ((p1 == 'X' && p4 == 'X' && p7 == 'X')) {
        ans = 'X';

        print('X wins');
        x++;
      } else {
        ans = 'O';

        print('O wins');
        y++;
      }
      setState(() {
        c1 = false;
        c4 = false;
        c7 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });

      return;
    } else if ((p4 == 'X' && p5 == 'X' && p6 == 'X') ||
        (p4 == 'O' && p5 == 'O' && p6 == 'O')) {
      String ans = "";
      if ((p4 == 'X' && p5 == 'X' && p6 == 'X')) {
        ans = 'X';

        print('X wins');
        x++;
      } else {
        ans = 'O';

        print('O wins');
        y++;
      }
      setState(() {
        c4 = false;
        c5 = false;
        c6 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else if ((p7 == 'X' && p8 == 'X' && p9 == 'X') ||
        (p7 == 'O' && p8 == 'O' && p9 == 'O')) {
      String ans = '';
      if ((p7 == 'X' && p8 == 'X' && p9 == 'X')) {
        ans = 'X';

        print('X wins');
        x++;
      } else {
        ans = 'O';

        print("O wins");
        y++;
      }
      setState(() {
        c7 = false;
        c8 = false;
        c9 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else if ((p2 == 'X' && p5 == 'X' && p8 == 'X') ||
        (p2 == 'O' && p5 == 'O' && p8 == 'O')) {
      String ans = "";
      if ((p2 == 'X' && p5 == 'X' && p8 == 'X')) {
        ans = "X";

        print('X wins');
        x++;
      } else {
        ans = "O";

        print("O wins");
        y++;
      }
      setState(() {
        c2 = false;
        c5 = false;
        c8 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else if ((p3 == 'X' && p6 == 'X' && p9 == 'X') ||
        (p3 == 'O' && p6 == 'O' && p9 == 'O')) {
      String ans = "";
      if ((p3 == 'X' && p6 == 'X' && p9 == 'X')) {
        ans = "X";

        print("x wins");
        x++;
      } else {
        ans = "O";

        print("O wins");
        y++;
      }
      setState(() {
        c3 = false;
        c6 = false;
        c9 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else if ((p1 == 'X' && p5 == 'X' && p9 == 'X') ||
        (p1 == 'O' && p5 == 'O' && p9 == 'O')) {
      String ans = "";
      if ((p1 == 'X' && p5 == 'X' && p9 == 'X')) {
        ans = "X";

        print('X wins');
        x++;
      } else {
        ans = "O";

        print('O wins');
        y++;
      }
      setState(() {
        c1 = false;
        c5 = false;
        c9 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else if ((p3 == 'X' && p5 == 'X' && p7 == 'X') ||
        (p3 == 'O' && p5 == 'O' && p7 == 'O')) {
      String ans = "";
      if ((p3 == 'X' && p5 == 'X' && p7 == 'X')) {
        ans = 'X';

        print("X wins");
        x++;
      } else {
        ans = 'O';

        print("O wins");
        y++;
      }
      setState(() {
        c3 = false;
        c5 = false;
        c7 = false;
        lock = true;
      });
      Future.delayed(Duration(milliseconds: 600), () {
        ans == "O" ? player.play('Winsound.wav') : player.play('lose.wav');

        _showDialog(ans);
        makeitreset();
      });
      return;
    } else {
      int c = 0;
      for (int i = 0; i < 9; i++) {
        if (playerinput[i] == "") {
          c = 1;
          break;
        }
      }
      if (c == 0) {
        showtiedialog('X');
        makeitreset();
      }
    }
  }

  var offbutton = BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.white,
      offset: Offset(2.0, 2.0),
      blurRadius: 1.0,
      spreadRadius: 0.5,
    ),
    BoxShadow(
      color: Colors.white,
      offset: Offset(-5.0, -5.0),
      blurRadius: 1.0,
      spreadRadius: -3.0,
    ),
  ], color: Colors.grey[300], borderRadius: BorderRadius.circular(20));
  var offbutton2 = BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black45, //bottom
      offset: Offset(3.0, 3.0),
      blurRadius: 3.0,
      spreadRadius: -3.0,
    ),
    BoxShadow(
      color: Colors.black45,
      offset: Offset(-3.0, -3.0),
      blurRadius: 3.0,
      spreadRadius: -3.0,
    ),
  ], color: Color(0xFF091921), borderRadius: BorderRadius.circular(20));
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
    return Container(
      color: val == true ? col : col2,
      child: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 25),
                  height: 180,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: val == true
                              ? AssetImage('images/scientist.png')
                              : AssetImage('images/scientistday.png'),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        child: Image(
                          image: val == true
                              ? AssetImage('images/o.png')
                              : AssetImage('images/oday.png'),
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                  decoration: val == false
                      ? (turn == false ? styleforme2 : offbutton)
                      : (turn == false ? styleforme : offbutton2),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  height: 180,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: val == true
                              ? AssetImage('images/athlete.png')
                              : AssetImage('images/athleteday.png'),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        child: Image(
                          image: val == true
                              ? AssetImage('images/close.png')
                              : AssetImage('images/closeday.png'),
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                  decoration: val == false
                      ? (turn == true ? styleforme2 : offbutton)
                      : (turn == true ? styleforme : offbutton2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 50),
                  height: 40,
                  width: 100,
                  child: Text(
                    y.toString(),
                    style: TextStyle(
                        color: val == true ? Colors.white : colfortext,
                        fontFamily: 'Quicksansd',
                        decoration: TextDecoration.none,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  decoration: val == false ? (styleforme2) : (styleforme),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: Text(
                    x.toString(),
                    style: TextStyle(
                        color: val == true ? Colors.white : colfortext,
                        fontFamily: 'Quicksansd',
                        decoration: TextDecoration.none,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  decoration: val == false ? (styleforme2) : (styleforme),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a1 = false;
                      temp = false;
                      if (playerinput[0] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[0] = 'O';
                        } else {
                          playerinput[0] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a1 == true || playerinput[0] == ""
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? ((playerinput[0] == "O")
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : ((playerinput[0] == "O")
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a1 == true
                            ? styleforme2
                            : (c1 == true ? offbutton : greenverify()))
                        : (a1 == true
                            ? styleforme
                            : (c1 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a2 = false;
                      if (playerinput[1] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[1] = 'O';
                        } else {
                          playerinput[1] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a2 == true || playerinput[1] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[1] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[1] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a2 == true
                            ? styleforme2
                            : (c2 == true ? offbutton : greenverify()))
                        : (a2 == true
                            ? styleforme
                            : (c2 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a3 = false;
                      if (playerinput[2] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[2] = 'O';
                        } else {
                          playerinput[2] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a3 == true || playerinput[2] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[2] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[2] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a3 == true
                            ? styleforme2
                            : (c3 == true ? offbutton : greenverify()))
                        : (a3 == true
                            ? styleforme
                            : (c3 == true ? offbutton2 : greenverify())),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a4 = false;
                      if (playerinput[3] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[3] = 'O';
                        } else {
                          playerinput[3] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a4 == true || playerinput[3] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[3] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[3] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a4 == true
                            ? styleforme2
                            : (c4 == true ? offbutton : greenverify()))
                        : (a4 == true
                            ? styleforme
                            : (c4 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a5 = false;
                      if (playerinput[4] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[4] = 'O';
                        } else {
                          playerinput[4] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a5 == true || playerinput[4] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[4] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[4] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a5 == true
                            ? styleforme2
                            : (c5 == true ? offbutton : greenverify()))
                        : (a5 == true
                            ? styleforme
                            : (c5 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a6 = false;
                      if (playerinput[5] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[5] = 'O';
                        } else {
                          playerinput[5] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a6 == true || playerinput[5] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[5] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[5] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a6 == true
                            ? styleforme2
                            : (c6 == true ? offbutton : greenverify()))
                        : (a6 == true
                            ? styleforme
                            : (c6 == true ? offbutton2 : greenverify())),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a7 = false;
                      if (playerinput[6] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[6] = 'O';
                        } else {
                          playerinput[6] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a7 == true || playerinput[6] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[6] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[6] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a7 == true
                            ? styleforme2
                            : (c7 == true ? offbutton : greenverify()))
                        : (a7 == true
                            ? styleforme
                            : (c7 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a8 = false;
                      if (playerinput[7] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[7] = 'O';
                        } else {
                          playerinput[7] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a8 == true || playerinput[7] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[7] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[7] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a8 == true
                            ? styleforme2
                            : (c8 == true ? offbutton : greenverify()))
                        : (a8 == true
                            ? styleforme
                            : (c8 == true ? offbutton2 : greenverify())),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      a9 = false;
                      if (playerinput[8] == '' && lock == false) {
                        if (turn == true) {
                          playerinput[8] = 'O';
                        } else {
                          playerinput[8] = 'X';
                        }
                        if (turn == true) {
                          turn = false;
                        } else {
                          turn = true;
                        }
                        checkwhowin();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: a9 == true || playerinput[8] == ''
                          ? AssetImage('images/blank.png')
                          : val == false
                              ? (playerinput[8] == 'O'
                                  ? AssetImage('images/oday.png')
                                  : AssetImage('images/closeday.png'))
                              : (playerinput[8] == 'O'
                                  ? AssetImage('images/o.png')
                                  : AssetImage('images/close.png')),
                    ),
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: val == false
                        ? (a9 == true
                            ? styleforme2
                            : (c9 == true ? offbutton : greenverify()))
                        : (a9 == true
                            ? styleforme
                            : (c9 == true ? offbutton2 : greenverify())),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              player.play('buttonpress.wav');
              makeitreset();
            },
            child: Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(5),
              height: 60,
              width: double.infinity,
              child: Text(
                "Reset",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: val == false ? colfortext : Colors.white,
                    fontFamily: 'Quicksand',
                    fontSize: 35,
                    letterSpacing: 1.5,
                    decoration: TextDecoration.none),
              ),
              decoration: val == true ? styleforme : styleforme2,
            ),
          )
        ],
      ),
    );
  }
}
