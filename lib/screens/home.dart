import 'package:calc_challenge/nav/appbar.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNav((historyText) {
        setState(() {
          result = historyText;
        });
      }),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    result,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('⌫'),
                onPressed: () {
                  if (result.length > 0)
                    setState(() {
                      result = result.substring(0, result.length - 1);
                    });
                },
              ),
              TextButton(
                child: Text('C'),
                onPressed: () {
                  setState(() {
                    result = '';
                  });
                },
              ),
              TextButton(
                child: Text('%'),
                onPressed: () {
                  numClick('%');
                },
              ),
              TextButton(
                child: Text('/'),
                onPressed: () {
                  numClick('/');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('7'),
                onPressed: () {
                  numClick('7');
                },
              ),
              TextButton(
                child: Text('8'),
                onPressed: () {
                  numClick('8');
                },
              ),
              TextButton(
                child: Text('9'),
                onPressed: () {
                  numClick('9');
                },
              ),
              TextButton(
                child: Text('*'),
                onPressed: () {
                  numClick('*');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('4'),
                onPressed: () {
                  numClick('4');
                },
              ),
              TextButton(
                child: Text('5'),
                onPressed: () {
                  numClick('5');
                },
              ),
              TextButton(
                child: Text('6'),
                onPressed: () {
                  numClick('6');
                },
              ),
              TextButton(
                child: Text('-'),
                onPressed: () {
                  numClick('-');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('1'),
                onPressed: () {
                  numClick('1');
                },
              ),
              TextButton(
                child: Text('2'),
                onPressed: () {
                  numClick('2');
                },
              ),
              TextButton(
                child: Text('3'),
                onPressed: () {
                  numClick('3');
                },
              ),
              TextButton(
                child: Text('+'),
                onPressed: () {
                  numClick('+');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('.'),
                onPressed: () {
                  numClick('.');
                },
              ),
              TextButton(
                child: Text('0'),
                onPressed: () {
                  numClick('0');
                },
              ),
              TextButton(
                child: Text('00'),
                onPressed: () {
                  numClick('00');
                },
              ),
              TextButton(
                child: Text('='),
                onPressed: calculateResult,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void numClick(String text) {
    setState(() {
      result += text;
    });
  }

  void calculateResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var historyData = prefs.getStringList('historyData');
    if (historyData == null) historyData = <String>[];
    historyData.add(result);
    await prefs.setStringList('historyData', historyData);

    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    setState(() {
      result = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
}
