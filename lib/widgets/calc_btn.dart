import 'dart:html';

import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String btnText;
  final Color bgColor;
  final Color textColor;
  // var lightPurple50 = const Color(0x80DCBAFF);
  const CalcButton(
      {Key? key,
      required this.btnText, // non-nullable and required
      required this.bgColor, // non-nullable but optional with a default value
      required this.textColor // non-nullable but optional with a default value
      })
      : super(key: key);

  // const CalcButton({required this.btnText, required this.style = ''});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 8,
        bottom: 8,
      ),
      child: GestureDetector(
        onTap: () {
          btnText == 'AC'
              ? print('Cleared')
              : btnText == '%'
                  ? print('Percentage')
                  : print(btnText);
        },
        child: Container(
          // margin:
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CalcIconButton extends StatelessWidget {
  final String btnIcon;
  final Color bgColor;
  // var lightPurple50 = const Color(0x80DCBAFF);
  const CalcIconButton({
    Key? key,
    required this.btnIcon,
    required this.bgColor,
  }) : super(key: key);

  // const CalcButton({required this.btnText, required this.style = ''});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 8,
        bottom: 8,
      ),
      child: GestureDetector(
        onTap: () {
          if (btnIcon == 'assets/images/backspace-icon.png') {
            print('backspace');
          } else {
            print('square root');
          }
        },
        child: Container(
          // margin:
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Image.asset(
              btnIcon,
            ),
          ),
        ),
      ),
    );
  }
}
