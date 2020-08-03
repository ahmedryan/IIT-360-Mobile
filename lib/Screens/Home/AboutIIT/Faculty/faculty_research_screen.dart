import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_faculty_research.dart';
import 'package:iitappdevelopment/Model/model_research.dart';
import 'package:iitappdevelopment/Services/empty_check.dart';

class FacultyResearchScreen extends StatefulWidget {
  final facultyID;

  FacultyResearchScreen({this.facultyID});

  @override
  _FacultyResearchScreenState createState() => _FacultyResearchScreenState();
}

class _FacultyResearchScreenState extends State<FacultyResearchScreen> {
  Future<List<Research>> futureResearch;

  @override
  void initState() {
    super.initState();
    futureResearch = fetchFacultyResearch(widget.facultyID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futureResearch,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                Research research = snapshot.data[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: IsEmpty.isNotNull(
                            research.title,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Title: ${research.title}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: IsEmpty.isNotNull(
                            research.description,
                          ),
                          child: RichText(
                            //textAlign: TextAlign.start,
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                    text: 'Description: \n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: research.description),
                                ]),
                          ),
                        ),
                      ],
                    ),
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
