import 'package:flutter/material.dart';

class CalcBoxedButton extends StatelessWidget {
  final String btnText;
  final double btnTextPaddingTop;
  final Function callback;

  const CalcBoxedButton(
      {required this.btnText,
      this.btnTextPaddingTop = 15,
      required this.callback // non-nullable but optional with a default value
      });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    return GestureDetector(
      onTap: () {
        callback(btnText);
        // btnText == 'x' ? print('*') : print(btnText);
      },
      child: Container(
        // margin:
        height: 69,
        width: 56,
        decoration: BoxDecoration(
          color: lightPurple50,
          // borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: btnTextPaddingTop,
          ),
          child: Text(
            btnText,
            style: TextStyle(
              color: lightPink,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CalcBoxedEquationButton extends StatelessWidget {
  final String btnText;
  final Function callback;

  const CalcBoxedEquationButton(
      {required this.btnText,
      required this.callback // non-nullable but optional with a default value
      });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    return GestureDetector(
      onTap: () {
        callback(btnText);
        // print(btnText);
      },
      child: Container(
        // margin:
        height: 64,
        width: 56,
        decoration: BoxDecoration(
          color: deepPurple,
          // borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 22,
            bottom: 16,
          ),
          child: Text(
            btnText,
            style: TextStyle(
              color: lightPink,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
