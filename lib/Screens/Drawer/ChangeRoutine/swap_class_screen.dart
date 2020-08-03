import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class SwapClassScreen extends StatefulWidget {
  @override
  _SwapClassScreenState createState() => _SwapClassScreenState();
}

class _SwapClassScreenState extends State<SwapClassScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime classDate1;
  DateTime classDate2;
  String courseCode1;
  String courseCode2;

  swapClass() async {
    var modifiedCourseCode1 = courseCode1.replaceAll(' ', '%20');
    var modifiedCourseCode2 = courseCode2.replaceAll(' ', '%20');

    var response = await http.put(
        '${URL().swapClassURL}${global.user.email}/$modifiedCourseCode1/${classDate1.toString().substring(0, 10)}/$modifiedCourseCode2/${classDate2.toString().substring(0, 10)}');
    print(
        '${URL().swapClassURL}${global.user.email}/$modifiedCourseCode1/${classDate1.toString().substring(0, 10)}/$modifiedCourseCode2/${classDate2.toString().substring(0, 10)}');

    if (response.statusCode == 200) print('Classes has been swapped');
  }

  @override
  void initState() {
    super.initState();
    classDate1 = DateTime.now();
    classDate2 = DateTime.now();
    courseCode1 = '';
    courseCode2 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap Class'),
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
                    labelText: "Enter Course Code 1",
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
                    courseCode1 = val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter Course Code 2",
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
                    courseCode2 = val;
                  },
                ),
              ),
              ListTile(
                title: Text(
                    "Class Date 1: ${classDate1.year}, ${classDate1.month}, ${classDate1.day}"),
                trailing: Icon(Icons.date_range),
                onTap: _pickDate1,
              ),
              ListTile(
                title: Text(
                    "Class Date 2: ${classDate2.year}, ${classDate2.month}, ${classDate2.day}"),
                trailing: Icon(Icons.date_range),
                onTap: _pickDate2,
              ),
              RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    swapClass();
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

  _pickDate1() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: classDate1,
    );
    if (date != null)
      setState(() {
        classDate1 = date;
      });
  }

  _pickDate2() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: classDate2,
    );
    if (date != null)
      setState(() {
        classDate2 = date;
      });
  }
}

//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//ListTile(
//title: TextField(
//onChanged: (value) {
//courseCode1 = value;
//},
//decoration: InputDecoration(
//hintText: 'Course Code 1',
//),
//),
//),
//ListTile(
//title: TextField(
//onChanged: (value) {
//courseCode2 = value;
//},
//decoration: InputDecoration(
//hintText: 'Course Code 2',
//),
//),
//),
//ListTile(
//title: Text(
//"Class 1 Date: ${classDate1.year}, ${classDate1.month}, ${classDate1.day}"),
//trailing: Icon(Icons.date_range),
//onTap: _pickDate1,
//),
//ListTile(
//title: Text(
//"Class 2 Date: ${classDate2.year}, ${classDate2.month}, ${classDate2.day}"),
//trailing: Icon(Icons.date_range),
//onTap: _pickDate2,
//),
//],
//),
