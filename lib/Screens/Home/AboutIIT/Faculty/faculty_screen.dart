import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_faculty.dart';
import 'package:iitappdevelopment/Model/model_faculty.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/Faculty/faculty_profile_screen.dart';

class FacultyScreen extends StatefulWidget {
  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<FacultyScreen> {
  Future<List<Faculty>> futureFaculty;

  @override
  void initState() {
    super.initState();
    futureFaculty = fetchFaculty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureFaculty,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, index) {
                  Faculty faculty = snapshot.data[index];

//                  var blob = faculty.fkFacultyImage;
//                  var image = BASE64.decode();

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FacultyProfileScreen(facultyProfile: faculty);
                        }),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Image.network(
                                'http://lit360.000webhostapp.com/getImage.php?id=${faculty.fkFacultyImage}',
                              ), //FadeInImage use instead
                            ),
                            Text(
                              '${faculty.name}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${faculty.designation}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
