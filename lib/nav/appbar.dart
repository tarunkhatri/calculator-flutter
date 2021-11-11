import 'package:calc_challenge/screens/history.dart';
import 'package:flutter/material.dart';

class CustomNav extends StatelessWidget with PreferredSizeWidget {
  final Function historyItemClick;

  const CustomNav(this.historyItemClick);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Calculator'),
      actions: [
        Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen(historyItemClick)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('History'),
                )))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
