import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatelessWidget {
  final Function historyItemClick;

  const HistoryScreen(this.historyItemClick);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: getDataFromSharefPref(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {
                        historyItemClick(snapshot.data[i]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(snapshot.data[i]),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                )
              : Container();
        },
      ),
    );
  }

  Future<List<String>> getDataFromSharefPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('historyData');
  }
}
