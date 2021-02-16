import 'package:flutter/material.dart';

class commingsoon extends StatelessWidget {
  @override
  bool val;
  var colfortext = Colors.grey[700];
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

  commingsoon({this.val});
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: val == true ? Colors.grey[300] : Color(0xFF091921),
      child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'COMING  SOON.....',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: val == true ? colfortext : Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Quicksand'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.arrow_back,
                    color: val == true ? colfortext : Colors.white,
                  ),
                  decoration: val == true ? styleforme2 : styleforme,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
