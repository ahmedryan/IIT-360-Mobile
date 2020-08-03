import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_staff.dart';
import 'package:iitappdevelopment/Model/model_staff.dart';

class StaffScreen extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<StaffScreen> {
  Future<List<Staff>> futureStaff;

  @override
  void initState() {
    super.initState();
    futureStaff = fetchStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureStaff,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, index) {
                  Staff staff = snapshot.data[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.network(
                                'http://lit360.000webhostapp.com/getImage.php?id=${staff.fkStaffImage}'),
                          ),
                          Text(
                            '${staff.name}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${staff.designation}',
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
