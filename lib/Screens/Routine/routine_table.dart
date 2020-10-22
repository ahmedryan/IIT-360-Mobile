import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iitappdevelopment/Services/routine_initialization.dart';

class RoutineTable extends StatefulWidget {
  RoutineTable(this.routine);
  final RoutineInitialization routine;
  @override
  _RoutineTableState createState() => _RoutineTableState();
}

class _RoutineTableState extends State<RoutineTable> {
  double iconSize = 40;
  Color headerColor = Colors.grey[100];
  Color lunchColor = Colors.lightGreen[100];
  Color sundayColor = Colors.yellow[100];
  Color mondayColor = Colors.red[100];
  Color tuesdayColor = Colors.indigo[100];
  Color wednesdayColor = Colors.deepOrange[100];
  Color thursdayColor = Colors.blue[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routine"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          //border: TableBorder.all(color: Colors.white),
          columnWidths: {
            0: FractionColumnWidth(.12),
            1: FractionColumnWidth(.176),
            2: FractionColumnWidth(.176),
            3: FractionColumnWidth(.176),
            4: FractionColumnWidth(.176),
            5: FractionColumnWidth(.176),
          },
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(0.5),
                child: Container(
                  height: 30,
                  color: headerColor,
                ),
              ),
              DayContainer(
                headerColor: headerColor,
                day: 'Sun',
              ),
              DayContainer(
                headerColor: headerColor,
                day: 'Mon',
              ),
              DayContainer(
                headerColor: headerColor,
                day: 'Tue',
              ),
              DayContainer(
                headerColor: headerColor,
                day: 'Wed',
              ),
              DayContainer(
                headerColor: headerColor,
                day: 'Thu',
              ),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '08:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun8,
                  instructor: widget.routine.insSun8),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon8,
                  instructor: widget.routine.insMon8),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue8,
                  instructor: widget.routine.insTue8),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed8,
                  instructor: widget.routine.insWed8),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu8,
                  instructor: widget.routine.insThu8),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '09:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun9,
                  instructor: widget.routine.insSun9),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon9,
                  instructor: widget.routine.insMon9),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue9,
                  instructor: widget.routine.insTue9),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed9,
                  instructor: widget.routine.insWed9),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu9,
                  instructor: widget.routine.insThu9),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '10:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun10,
                  instructor: widget.routine.insSun10),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon10,
                  instructor: widget.routine.insMon10),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue10,
                  instructor: widget.routine.insTue10),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed10,
                  instructor: widget.routine.insWed10),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu10,
                  instructor: widget.routine.insThu10),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '11:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun11,
                  instructor: widget.routine.insSun11),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon11,
                  instructor: widget.routine.insMon11),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue11,
                  instructor: widget.routine.insTue11),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed11,
                  instructor: widget.routine.insWed11),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu11,
                  instructor: widget.routine.insThu11),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '12:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun12,
                  instructor: widget.routine.insSun12),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon12,
                  instructor: widget.routine.insMon12),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue12,
                  instructor: widget.routine.insTue12),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed12,
                  instructor: widget.routine.insWed12),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu12,
                  instructor: widget.routine.insThu12),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '01:00',
              ),
              LunchContainer(
                lunchColor: lunchColor,
                text: 'L',
              ),
              LunchContainer(
                lunchColor: lunchColor,
                text: 'U',
              ),
              LunchContainer(
                lunchColor: lunchColor,
                text: 'N',
              ),
              LunchContainer(
                lunchColor: lunchColor,
                text: 'C',
              ),
              LunchContainer(
                lunchColor: lunchColor,
                text: 'H',
              ),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '02:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun2,
                  instructor: widget.routine.insSun2),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon2,
                  instructor: widget.routine.insMon2),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue2,
                  instructor: widget.routine.insTue2),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed2,
                  instructor: widget.routine.insWed2),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu2,
                  instructor: widget.routine.insThu2),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '03:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun3,
                  instructor: widget.routine.insSun3),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon3,
                  instructor: widget.routine.insMon3),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue3,
                  instructor: widget.routine.insTue3),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed3,
                  instructor: widget.routine.insWed3),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu3,
                  instructor: widget.routine.insThu3),
            ]),
            TableRow(children: [
              TimeContainer(
                headerColor: headerColor,
                time: '04:00',
              ),
              CourseContainer(
                  dayColor: sundayColor,
                  course: widget.routine.sun4,
                  instructor: widget.routine.insSun4),
              CourseContainer(
                  dayColor: mondayColor,
                  course: widget.routine.mon4,
                  instructor: widget.routine.insMon4),
              CourseContainer(
                  dayColor: tuesdayColor,
                  course: widget.routine.tue4,
                  instructor: widget.routine.insTue4),
              CourseContainer(
                  dayColor: wednesdayColor,
                  course: widget.routine.wed4,
                  instructor: widget.routine.insWed4),
              CourseContainer(
                  dayColor: thursdayColor,
                  course: widget.routine.thu4,
                  instructor: widget.routine.insThu4),
            ]),
          ],
        ),
      ),
    );
  }
}

class LunchContainer extends StatelessWidget {
  const LunchContainer({
    Key key,
    @required this.lunchColor,
    @required this.text,
  }) : super(key: key);

  final Color lunchColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        height: 62,
        decoration: new BoxDecoration(
            color: lunchColor, borderRadius: new BorderRadius.circular(2)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class DayContainer extends StatelessWidget {
  const DayContainer({
    Key key,
    @required this.headerColor,
    @required this.day,
  }) : super(key: key);

  final Color headerColor;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        height: 30,
        decoration: new BoxDecoration(
            color: headerColor, borderRadius: new BorderRadius.circular(2)),
        child: Center(
            child: Text(
          day,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    Key key,
    @required this.headerColor,
    @required this.time,
  }) : super(key: key);

  final Color headerColor;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        height: 62,
        decoration: new BoxDecoration(
            color: headerColor, borderRadius: new BorderRadius.circular(2)),
        child: Center(
            child: Text(
          time,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  const CourseContainer({
    Key key,
    @required this.dayColor,
    @required this.course,
    @required this.instructor,
  }) : super(key: key);

  final Color dayColor;
  final String course;
  final String instructor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        height: 62,
        decoration: new BoxDecoration(
            color: dayColor, borderRadius: new BorderRadius.circular(2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              course,
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
                //fontWeight: FontWeight.bold
              ),
            ),
            Text(
              instructor,
              softWrap: true,
              style: TextStyle(
                fontSize: 15,
                //fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
