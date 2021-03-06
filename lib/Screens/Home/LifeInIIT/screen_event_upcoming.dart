import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_event_upcoming.dart';
import 'package:iitappdevelopment/Model/model_event.dart';
import 'package:iitappdevelopment/Services/readable_date.dart';

class UpcomingEventScreen extends StatefulWidget {
  @override
  _UpcomingEventScreenState createState() => _UpcomingEventScreenState();
}

class _UpcomingEventScreenState extends State<UpcomingEventScreen> {
  Future<List<Event>> futureEvent;

  @override
  void initState() {
    super.initState();
    futureEvent = fetchEventUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
      ),
      body: FutureBuilder(
        future: futureEvent,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                Event event = snapshot.data[index];

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
                                  event.venue,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(ReadableDate.convertDate('${event.date}')),
                              Text(event.time),
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
                                  '${event.title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                '${event.description}',
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
    );
  }
}
