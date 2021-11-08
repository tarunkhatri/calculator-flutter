import 'package:calc_challenge/nav/appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNav(),
      body: Column(
        children: [
          Row(
            children: [
              Text('Implement display here'),
            ],
          ),
          Row(
            children: [
              Text('Implement interaction buttons here'),
            ],
          )
        ],
      ),
    );
  }
}
