import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_project_scholarship.dart';
import 'package:iitappdevelopment/Model/model_project_scholarship.dart';

class FacultyProjectScholarshipScreen extends StatefulWidget {
  final String facultyID;
  FacultyProjectScholarshipScreen({this.facultyID});

  @override
  _FacultyProjectScholarshipScreenState createState() =>
      _FacultyProjectScholarshipScreenState();
}

class _FacultyProjectScholarshipScreenState
    extends State<FacultyProjectScholarshipScreen> {
  Future<List<ProjectScholarship>> futureProjectScholarship;

  @override
  void initState() {
    super.initState();
    futureProjectScholarship = fetchProjectScholarship(widget.facultyID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futureProjectScholarship,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                ProjectScholarship projectScholarship = snapshot.data[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text('Title: ${projectScholarship.title}'),
                        Text('Type: ${projectScholarship.proScholType}'),
                        Text('${projectScholarship.description}'),
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
