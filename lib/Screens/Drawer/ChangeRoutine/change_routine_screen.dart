import 'package:flutter/material.dart';
import 'package:iitappdevelopment/Screens/Drawer/ChangeRoutine/class_cancel_screen.dart';
import 'package:iitappdevelopment/Screens/Drawer/ChangeRoutine/extra_class_screen.dart';
import 'package:iitappdevelopment/Screens/Drawer/ChangeRoutine/reschedule_class_screen.dart';
import 'package:iitappdevelopment/Screens/Drawer/ChangeRoutine/swap_class_screen.dart';

class ChangeRoutine extends StatefulWidget {
  @override
  _ChangeRoutineState createState() => _ChangeRoutineState();
}

class _ChangeRoutineState extends State<ChangeRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reschedule Class'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClassCancelScreen();
                }));
              },
              child: Text('Class Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RescheduleClassScreen();
                }));
              },
              child: Text('Class Reschedule'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ExtraClassScreen();
                }));
              },
              child: Text('Extra Class'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SwapClassScreen();
                }));
              },
              child: Text('Class Swap'),
            ),
          ],
        ),
      ),
    );
  }
}
