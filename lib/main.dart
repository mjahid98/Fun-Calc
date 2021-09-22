import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      if (text == 'x' || text == '/' || text == '+' || text == '-') {
        if (_expression.endsWith('x') ||
            _expression.endsWith('/') ||
            _expression.endsWith('+') ||
            _expression.endsWith('-')) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
        _expression += text;
      } else {
        _expression += text;
      }
      // print(btnIcon);
    });
  }

  void iconButtonClick(String btnIcon) {
    setState(() {
      if (btnIcon == 'assets/images/backspace-icon.png') {
        // Backspace
        _expression = _expression.substring(0, _expression.length - 1);
      }
      // else {
      //   _expression += '√';
      //   sqrt(_expression);
      // }
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void answer(String text) {
    String solver = _expression.replaceAll('x', '*');

    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(solver);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        _history = _expression;
        eval.toString().endsWith('.0') || eval.toString().endsWith('.00')
            // ? _expression = eval.toString().substring(0, _expression.length - 2)
            ? _expression = eval.toString().replaceAll('.0', '')
            : _expression = '$eval';
      } catch (e) {
        _history = 'Error! incorrect math.';
      }
      // if (_expression.substring(_expression.length - 1) == '+' ||
      //     _expression.substring(_expression.length - 1) == '-' ||
      //     _expression.substring(_expression.length - 1) == 'x' ||
      //     _expression.substring(_expression.length - 1) == '/')
      // if (_expression.endsWith('x') ||
      //     _expression.endsWith('/') ||
      //     _expression.endsWith('+') ||
      //     _expression.endsWith('-')) {
      //   _history = 'Error, please correct the expression';
      // } else {
      //   _history = _expression;
      //   // _expression = _expression.replaceAll('x', '*');
      //   // solver += int.parse(_expression);
      //   // solver = _expression;
      //   // print(solver);
      //   // print(solver);
      //   // =========
      //   // .0 solver
      //   // var pointZeroSolver = '$eval';
      //   // =========
      //   // if('$eval'.contains('.00'))
      //   // eval.toString().substring(_expression.length - 2) == '.0'
      //   // eval.toString().contains(new RegExp(r'.0'))
      //   eval.toString().endsWith('.0') || eval.toString().endsWith('.00')
      //       // ? _expression = eval.toString().substring(0, _expression.length - 2)
      //       ? _expression = eval.toString().replaceAll('.0', '')
      //       : _expression = '$eval';
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lightPink = Color(0xFFF38CB6);
    var lightPurple = Color(0xFFDCBAFF);
    var lightPurple50 = Color(0x80DCBAFF);
    var deepLightPurple = Color(0x99361561);
    var deepPurple = Color(0xA1110F61);

    // final String lastCalculation = '';

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
                  _history,
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
                  _expression,
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
                              callback: allClear,
                            ),
                            CalcButton(
                              btnText: '%',
                              bgColor: deepLightPurple,
                              textColor: lightPink,
                              callback: numClick,
                            ),
                            CalcIconButton(
                              btnIcon: 'assets/images/backspace-icon.png',
                              bgColor: deepLightPurple,
                              callback: iconButtonClick,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcButton(
                              btnText: '7',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '8',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '9',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
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
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '5',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '6',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
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
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '2',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '3',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
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
                              callback: numClick,
                            ),
                            CalcButton(
                              btnText: '0',
                              bgColor: lightPurple50,
                              textColor: deepLightPurple,
                              callback: numClick,
                            ),
                            CalcIconButton(
                              btnIcon: 'assets/images/square-root-icon.png',
                              bgColor: lightPurple50,
                              callback: iconButtonClick,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CalcBoxedButton(
                          btnText: '/',
                          callback: numClick,
                        ),
                        CalcBoxedButton(
                          btnText: 'x',
                          btnTextPaddingTop: 19,
                          callback: numClick,
                        ),
                        CalcBoxedButton(
                          btnText: '-',
                          btnTextPaddingTop: 22,
                          callback: numClick,
                        ),
                        CalcBoxedButton(
                          btnText: '+',
                          btnTextPaddingTop: 25,
                          callback: numClick,
                        ),
                        CalcBoxedEquationButton(
                          btnText: '=',
                          callback: answer,
                        )
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
