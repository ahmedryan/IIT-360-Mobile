import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/Model/model_academic.dart';
import 'package:iitappdevelopment/Services/empty_check.dart';

class AcademicSectionScreen extends StatefulWidget {
  final Future<List<Academic>> futureAcademicFunction;
  AcademicSectionScreen(this.futureAcademicFunction);

  @override
  _AcademicSectionScreenState createState() => _AcademicSectionScreenState();
}

class _AcademicSectionScreenState extends State<AcademicSectionScreen> {
  Future<List<Academic>> futureAcademicUGS;

  @override
  void initState() {
    super.initState();
    futureAcademicUGS = widget.futureAcademicFunction;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Undergraduate Studies'),
      ),
      body: FutureBuilder(
        future: futureAcademicUGS,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                Academic academicUGS = snapshot.data[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            academicUGS.programs,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Visibility(
                          visible: IsEmpty.isNotEmptyString(
                              academicUGS.academicInfo),
                          child: Text(
                            'Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: IsEmpty.isNotEmptyString(
                              academicUGS.academicInfo),
                          child: Text(academicUGS.academicInfo),
                        ),
                        Visibility(
                          visible: IsEmpty.isNotEmptyString(
                              academicUGS.academicAdmission),
                          child: Text(
                            'Admission',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Visibility(
                            visible: IsEmpty.isNotEmptyString(
                                academicUGS.academicAdmission),
                            child: Text(academicUGS.academicAdmission)),
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
