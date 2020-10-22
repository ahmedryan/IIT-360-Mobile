import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class ExtraClassScreen extends StatefulWidget {
  @override
  _ExtraClassScreenState createState() => _ExtraClassScreenState();
}

class _ExtraClassScreenState extends State<ExtraClassScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime classDate;
  TimeOfDay beginTime;
  TimeOfDay endTime;
  String courseCode;
  String semester;
  String instructorCode;

  String dayFunction() {
    if (classDate.weekday == 1) return 'Mon';
    if (classDate.weekday == 2) return 'Tue';
    if (classDate.weekday == 3) return 'Wed';
    if (classDate.weekday == 4) return 'Thu';
    if (classDate.weekday == 5) return 'Fri';
    if (classDate.weekday == 6)
      return 'Sat';
    else
      return 'Sun';
  }

  extraClass() async {
    var modifiedCourseCode = courseCode.replaceAll(' ', '%20');
    String day = dayFunction();

    var response = await http.post(
        '${URL().extraClassURL}${global.user.email}/$modifiedCourseCode/${classDate.toString().substring(0, 10)}/${beginTime.toString().substring(10, 15)}/${endTime.toString().substring(10, 15)}/$day/$instructorCode');

    //print
    print(
        '${URL().extraClassURL}${global.user.email}/$modifiedCourseCode/${classDate.toString().substring(0, 10)}/${beginTime.toString().substring(10, 15)}/${endTime.toString().substring(10, 15)}/$day/$instructorCode');
    print(response.statusCode);

    if (response.statusCode == 200) print('Class has been added!');
  }

  @override
  void initState() {
    super.initState();
    classDate = DateTime.now();
    beginTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
    courseCode = '';
    semester = '';
    instructorCode = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extra Class'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter Course Code",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Course Code cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: (val) {
                    courseCode = val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter Instructor Code",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Instructor Code cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                  onChanged: (val) {
                    instructorCode = val;
                  },
                ),
              ),
              ListTile(
                title: Text(
                    "Class Date: ${classDate.year}, ${classDate.month}, ${classDate.day}"),
                trailing: Icon(Icons.date_range),
                onTap: _pickClassDate,
              ),
              ListTile(
                title:
                    Text("Begin Time: ${beginTime.hour}:${beginTime.minute}"),
                trailing: Icon(Icons.access_time),
                onTap: () {
                  _pickBeginTime();
                },
              ),
              ListTile(
                title: Text("End Time: ${endTime.hour}:${endTime.minute}"),
                trailing: Icon(Icons.access_time),
                onTap: () {
                  _pickEndTime();
                },
              ),
              RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    extraClass();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickClassDate() async {
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

  _pickBeginTime() async {
    TimeOfDay t =
        await showTimePicker(context: context, initialTime: beginTime);
    if (t != null)
      setState(() {
        beginTime = t;
      });
  }

  _pickEndTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: endTime);
    if (t != null)
      setState(() {
        endTime = t;
      });
  }
}

//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//ListTile(
//title: TextField(
//onChanged: (value) {
//courseCode = value;
//},
//decoration: InputDecoration(
//hintText: 'Course Code',
//),
//),
//),
//ListTile(
//title: TextField(
//onChanged: (value) {
//instructorCode = value;
//},
//decoration: InputDecoration(
//hintText: 'Instructor Code',
//),
//),
//),
//ListTile(
//title: TextField(
//onChanged: (value) {
//semester = value;
//},
//decoration: InputDecoration(
//hintText: 'Semester',
//),
//),
//),
//ListTile(
//title: Text(
//"Class Date: ${classDate.year}, ${classDate.month}, ${classDate.day}"),
//trailing: Icon(Icons.date_range),
//onTap: _pickClassDate,
//),
//ListTile(
//title: Text("Begin Time: ${beginTime.hour}:${beginTime.minute}"),
//trailing: Icon(Icons.access_time),
//onTap: () {
//_pickBeginTime();
//},
//),
//ListTile(
//title: Text("End Time: ${endTime.hour}:${endTime.minute}"),
//trailing: Icon(Icons.access_time),
//onTap: () {
//_pickEndTime();
//},
//),
//],
//),
