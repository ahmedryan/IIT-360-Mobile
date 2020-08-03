import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_institution.dart';
import 'package:iitappdevelopment/Model/model_institution.dart';

class InstitutionScreen extends StatefulWidget {
  @override
  _InstitutionScreenState createState() => _InstitutionScreenState();
}

class _InstitutionScreenState extends State<InstitutionScreen> {
  Future<List<Institution>> futureInstitution;

  @override
  void initState() {
    super.initState();
    futureInstitution = fetchInstitution();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Institution'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureInstitution,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Institution institution = snapshot.data[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('${institution.instHeader}'),
                          Text('${institution.instDescription}'),
                          Text('Image'),
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
      ),
    );
  }
}
