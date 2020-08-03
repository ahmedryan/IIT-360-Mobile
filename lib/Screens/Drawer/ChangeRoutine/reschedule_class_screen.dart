import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class RescheduleClassScreen extends StatefulWidget {
  @override
  _RescheduleClassScreenState createState() => _RescheduleClassScreenState();
}

class _RescheduleClassScreenState extends State<RescheduleClassScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime oldDate;
  DateTime newDate;
  TimeOfDay beginTime;
  TimeOfDay endTime;
  String courseCode;

  rescheduleClass() async {
    var modifiedCourseCode = courseCode.replaceAll(' ', '%20');

    var response = await http.post(
        '${URL().rescheduleClassURL}${global.user.email}/$modifiedCourseCode/${oldDate.toString().substring(0, 10)}/${newDate.toString().substring(0, 10)}/${beginTime.toString().substring(10, 15)}/${endTime.toString().substring(10, 15)}');
    print(
        '${URL().rescheduleClassURL}${global.user.email}/$modifiedCourseCode/${oldDate.toString().substring(0, 10)}/${newDate.toString().substring(0, 10)}/${beginTime.toString().substring(10, 15)}/${endTime.toString().substring(10, 15)}');

    if (response.statusCode == 200) print('Class has been rescheduled!');
  }

  @override
  void initState() {
    super.initState();
    oldDate = DateTime.now();
    newDate = DateTime.now();
    beginTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
    courseCode = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reschedule Class'),
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
              ListTile(
                title: Text(
                    "Old Date: ${oldDate.year}, ${oldDate.month}, ${oldDate.day}"),
                trailing: Icon(Icons.date_range),
                onTap: _pickOldDate,
              ),
              ListTile(
                title: Text(
                    "New Date: ${newDate.year}, ${newDate.month}, ${newDate.day}"),
                trailing: Icon(Icons.date_range),
                onTap: _pickNewDate,
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
                    rescheduleClass();
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

  _pickOldDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: oldDate,
    );
    if (date != null)
      setState(() {
        oldDate = date;
      });
  }

  _pickNewDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: newDate,
    );
    if (date != null)
      setState(() {
        newDate = date;
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
