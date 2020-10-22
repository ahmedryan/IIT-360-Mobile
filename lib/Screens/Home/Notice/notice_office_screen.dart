import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_notice_general.dart';
import 'package:iitappdevelopment/Model/model_notice.dart';
import 'package:iitappdevelopment/Services/readable_date.dart';

class NoticeOfficeScreen extends StatefulWidget {
  @override
  _NoticeOfficeState createState() => _NoticeOfficeState();
}

class _NoticeOfficeState extends State<NoticeOfficeScreen> {
  Future<List<Notice>> futureNotice;

  @override
  void initState() {
    super.initState();
    futureNotice = fetchNoticeOffice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: futureNotice,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Notice notice = snapshot.data[index];

                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${notice.section}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                    ReadableDate.convertDate('${notice.date}')),
                                Text('${notice.time}'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${notice.title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  '${notice.description}',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${notice.fkNoticeDocument}',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
