import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_faculty_publication.dart';
import 'package:iitappdevelopment/Model/model_faculty_publication.dart';

class FacultyPublicationScreen extends StatefulWidget {
  final String facultyID;
  FacultyPublicationScreen({this.facultyID});

  @override
  _FacultyPublicationScreenState createState() =>
      _FacultyPublicationScreenState();
}

class _FacultyPublicationScreenState extends State<FacultyPublicationScreen> {
  Future<List<FacultyPublication>> futureFacultyPublication;

  @override
  void initState() {
    super.initState();
    futureFacultyPublication = fetchFacultyPublication(widget.facultyID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futureFacultyPublication,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                FacultyPublication facultyPublication = snapshot.data[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text('title: ${facultyPublication.title}'),
                        Text('type: ${facultyPublication.pubType}'),
                        Text('year: ${facultyPublication.pubYear}'),
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
