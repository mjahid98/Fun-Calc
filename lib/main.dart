import 'package:flutter/material.dart';

import 'widgets/calc_boxed_btn.dart';
import 'widgets/calc_btn.dart';

void main() {
  runApp(const FunCalc());
}

class FunCalc extends StatelessWidget {
  const FunCalc({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun Calc',
      home: FunCalcHome(title: 'FUN CALC'),
      theme: ThemeData(fontFamily: 'Robot World'),
    );
  }
}

class FunCalcHome extends StatefulWidget {
  const FunCalcHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FunCalcHome> createState() => _FunCalcHomeState();
}

class _FunCalcHomeState extends State<FunCalcHome> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    return Container(
      height: screenHeight,
      width: screenWidth,
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main-bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: lightPink),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // decoration: const BoxDecoration(
                //   color: Colors.red,
                // ),
                width: screenWidth,
                child: Text(
                  '40 + 20 × 3 ÷ 5 − 8',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: lightPurple,
                    fontSize: 18,
                    letterSpacing: 2,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // child: const CalcButton(),
                margin: const EdgeInsets.symmetric(horizontal: 32),
              ),
              Container(
                // decoration: const BoxDecoration(
                //   color: Colors.red,
                // ),
                width: screenWidth,
                child: Text(
                  '44',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: lightPink,
                    fontSize: 36,
                    letterSpacing: 2,
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0x33DCBAFF),
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: 'AC',
                              bgColor: deepLightPurple,
                              textColor: lightPink,
                            ),
                            CalcButton(
                              btnText: '%',
                              bgColor: deepLightPurple,
                              textColor: lightPink,
                            ),
                            CalcIconButton(
                                btnIcon: 'assets/images/backspace-icon.png',
                                bgColor: deepLightPurple,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: '7',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '8',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '9',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: '4',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '5',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '6',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: '1',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '2',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '3',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: '.',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcButton(
                              btnText: '0',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                            ),
                            CalcIconButton(
                              btnIcon: 'assets/images/square-root-icon.png',
                              bgColor: lightPurple50,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcBoxedButton(btnText: '/'),
                        CalcBoxedButton(btnText: 'x'),
                        CalcBoxedButton(btnText: '-'),
                        CalcBoxedButton(btnText: '+'),
                        CalcBoxedEquationButton(btnText: '=')
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
