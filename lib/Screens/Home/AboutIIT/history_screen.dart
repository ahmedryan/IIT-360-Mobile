import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_history.dart';
import 'package:iitappdevelopment/Model/model_history.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  Future<List<History>> futureHistory;

  @override
  void initState() {
    super.initState();
    futureHistory = fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureHistory,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text('Roll of Honour'),
                  Text('Computer Center (1985-2001)'),
                  //Table(),
                  Text('Institute of Information Technology (2001-till date)'),
                  //Table(),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
