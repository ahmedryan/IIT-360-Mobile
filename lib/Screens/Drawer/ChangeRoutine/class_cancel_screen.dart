import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class ClassCancelScreen extends StatefulWidget {
  @override
  _ClassCancelScreenState createState() => _ClassCancelScreenState();
}

class _ClassCancelScreenState extends State<ClassCancelScreen> {
  String courseCode;
  DateTime classDate;

  cancelClass() async {
    var modifiedCourseCode = courseCode.replaceAll(' ', '%20');
    var response = await http.delete(
        '${URL().classCancelURL}${global.user.email}/$modifiedCourseCode/${classDate.toString().substring(0, 10)}');
    print(
        '${URL().classCancelURL}${global.user.email}/$modifiedCourseCode/${classDate.toString().substring(0, 10)}');

    print(response.statusCode);

//    if (response.statusCode == 200) {
//      return AlertDialog(
//        title: Text('Class Cancel Successful'),
//      );
//    }
  }

  @override
  void initState() {
    super.initState();
    classDate = DateTime.now();
    courseCode = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancel Class'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  courseCode = value;
                },
                decoration: InputDecoration(
                  hintText: 'Course Code',
                ),
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            ListTile(
              title:
                  Text("Class Date: ${classDate.toString().substring(0, 10)}"),
              trailing: Icon(Icons.date_range),
              onTap: _pickDate,
            ),
            Center(
              child: RaisedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    cancelClass();
                  }),
            )
          ],
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: classDate,
    );
    if (date != null)
      setState(() {
        classDate = date;
      });
  }
}
