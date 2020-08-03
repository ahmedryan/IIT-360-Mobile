import 'package:iitappdevelopment/API_Call/call_routine.dart';
import 'package:iitappdevelopment/Model/model_routine.dart';

class RoutineList {
  List<Routine> weekRoutine = List<Routine>();

  Future<void> loadData() async {
    var jsonBody = await fetchRoutine();

    for (var data in jsonBody) {
      weekRoutine.add(
        Routine(
            date: data.date,
            courseCode: data.courseCode,
            beginTime: data.beginTime,
            endTime: data.endTime,
            semester: data.semester,
            dayName: data.dayName,
            fkInstructorId: data.fkInstructorId),
      );
    }

    print('size: ${weekRoutine.length}');

    weekRoutine.forEach(
      (element) {
        print('Name: ${element.courseCode}');
//        print('begins: ${element.beginTime}');
//        print('ends: ${element.endTime}');
//        print('day: ${element.dayName}');
//        print('semester: ${element.semester}');
      },
    );
  }
}

class RoutineInitialization {
  RoutineList _routineList = RoutineList();
  List<Routine> _weekRoutine = List<Routine>();

  String sun8 = '',
      sun9 = '',
      sun10 = '',
      sun11 = '',
      sun12 = '',
      sun2 = '',
      sun3 = '',
      sun4 = '';
  String insSun8 = '',
      insSun9 = '',
      insSun10 = '',
      insSun11 = '',
      insSun12 = '',
      insSun2 = '',
      insSun3 = '',
      insSun4 = '';
  String mon8 = '',
      mon9 = '',
      mon10 = '',
      mon11 = '',
      mon12 = '',
      mon2 = '',
      mon3 = '',
      mon4 = '';
  String insMon8 = '',
      insMon9 = '',
      insMon10 = '',
      insMon11 = '',
      insMon12 = '',
      insMon2 = '',
      insMon3 = '',
      insMon4 = '';
  String tue8 = '',
      tue9 = '',
      tue10 = '',
      tue11 = '',
      tue12 = '',
      tue2 = '',
      tue3 = '',
      tue4 = '';
  String insTue8 = '',
      insTue9 = '',
      insTue10 = '',
      insTue11 = '',
      insTue12 = '',
      insTue2 = '',
      insTue3 = '',
      insTue4 = '';
  String wed8 = '',
      wed9 = '',
      wed10 = '',
      wed11 = '',
      wed12 = '',
      wed2 = '',
      wed3 = '',
      wed4 = '';
  String insWed8 = '',
      insWed9 = '',
      insWed10 = '',
      insWed11 = '',
      insWed12 = '',
      insWed2 = '',
      insWed3 = '',
      insWed4 = '';
  String thu8 = '',
      thu9 = '',
      thu10 = '',
      thu11 = '',
      thu12 = '',
      thu2 = '',
      thu3 = '',
      thu4 = '';
  String insThu8 = '',
      insThu9 = '',
      insThu10 = '',
      insThu11 = '',
      insThu12 = '',
      insThu2 = '',
      insThu3 = '',
      insThu4 = '';

  Future<String> initialize() async {
    await _routineList.loadData();
    print('hoho: ${_routineList.weekRoutine.length}');
    _weekRoutine.addAll(_routineList.weekRoutine);
    print('hehe: ${_weekRoutine.length}');

    //Sunday
    sun8 = searchCourse('Sun', '08:00:00', '08:50:00', 'B5');
    insSun8 = searchInstructor('Sun', '08:00:00', '08:50:00', 'B5');
    sun9 = searchCourse('Sun', '09:00:00', '09:50:00', 'B5');
    insSun9 = searchInstructor('Sun', '09:00:00', '09:50:00', 'B5');
    sun10 = searchCourse('Sun', '10:00:00', '10:50:00', 'B5');
    insSun10 = searchInstructor('Sun', '10:00:00', '10:50:00', 'B5');
    sun11 = searchCourse('Sun', '11:00:00', '11:50:00', 'B5');
    insSun11 = searchInstructor('Sun', '11:00:00', '11:50:00', 'B5');
    sun12 = searchCourse('Sun', '12:00:00', '12:50:00', 'B5');
    insSun12 = searchInstructor('Sun', '12:00:00', '12:50:00', 'B5');
    sun2 = searchCourse('Sun', '14:00:00', '14:50:00', 'B5');
    insSun2 = searchInstructor('Sun', '14:00:00', '14:50:00', 'B5');
    sun3 = searchCourse('Sun', '15:00:00', '15:50:00', 'B5');
    insSun3 = searchInstructor('Sun', '15:00:00', '15:50:00', 'B5');
    sun4 = searchCourse('Sun', '16:00:00', '16:50:00', 'B5');
    insSun4 = searchInstructor('Sun', '16:00:00', '16:50:00', 'B5');

    //Monday
    mon8 = searchCourse('Mon', '08:00:00', '08:50:00', 'B5');
    insMon8 = searchInstructor('Mon', '08:00:00', '08:50:00', 'B5');
    mon9 = searchCourse('Mon', '09:00:00', '09:50:00', 'B5');
    insMon9 = searchInstructor('Mon', '09:00:00', '09:50:00', 'B5');
    mon10 = searchCourse('Mon', '10:00:00', '10:50:00', 'B5');
    insMon10 = searchInstructor('Mon', '10:00:00', '10:50:00', 'B5');
    mon11 = searchCourse('Mon', '11:00:00', '11:50:00', 'B5');
    insMon11 = searchInstructor('Mon', '11:00:00', '11:50:00', 'B5');
    mon12 = searchCourse('Mon', '12:00:00', '12:50:00', 'B5');
    insMon12 = searchInstructor('Mon', '12:00:00', '12:50:00', 'B5');
    mon2 = searchCourse('Mon', '14:00:00', '14:50:00', 'B5');
    insMon2 = searchInstructor('Mon', '14:00:00', '14:50:00', 'B5');
    mon3 = searchCourse('Mon', '15:00:00', '15:50:00', 'B5');
    insMon3 = searchInstructor('Mon', '15:00:00', '15:50:00', 'B5');
    mon4 = searchCourse('Mon', '10:00:00', '10:50:00', 'B5');
    insMon4 = searchInstructor('Mon', '10:00:00', '10:50:00', 'B5');

    //Tuesday
    tue8 = searchCourse('Tue', '08:00:00', '08:50:00', 'B5');
    insTue8 = searchInstructor('Tue', '08:00:00', '08:50:00', 'B5');
    tue9 = searchCourse('Tue', '09:00:00', '09:50:00', 'B5');
    insTue9 = searchInstructor('Tue', '09:00:00', '09:50:00', 'B5');
    tue10 = searchCourse('Tue', '10:00:00', '10:50:00', 'B5');
    insTue10 = searchInstructor('Tue', '10:00:00', '10:50:00', 'B5');
    tue11 = searchCourse('Tue', '11:00:00', '11:50:00', 'B5');
    insTue11 = searchInstructor('Tue', '11:00:00', '11:50:00', 'B5');
    tue12 = searchCourse('Tue', '12:00:00', '12:50:00', 'B5');
    insTue12 = searchInstructor('Tue', '12:00:00', '12:50:00', 'B5');
    tue2 = searchCourse('Tue', '14:00:00', '14:50:00', 'B5');
    insTue2 = searchInstructor('Tue', '14:00:00', '14:50:00', 'B5');
    tue3 = searchCourse('Tue', '15:00:00', '15:50:00', 'B5');
    insTue3 = searchInstructor('Tue', '15:00:00', '15:50:00', 'B5');
    tue4 = searchCourse('Tue', '16:00:00', '16:50:00', 'B5');
    insTue4 = searchInstructor('Tue', '16:00:00', '16:50:00', 'B5');

    //Wednesday
    wed8 = searchCourse('Wed', '08:00:00', '08:50:00', 'B5');
    insWed8 = searchInstructor('Wed', '08:00:00', '08:50:00', 'B5');
    wed9 = searchCourse('Wed', '09:00:00', '09:50:00', 'B5');
    insWed9 = searchInstructor('Wed', '09:00:00', '09:50:00', 'B5');
    wed10 = searchCourse('Wed', '10:00:00', '10:50:00', 'B5');
    insWed10 = searchInstructor('Wed', '10:00:00', '10:50:00', 'B5');
    wed11 = searchCourse('Wed', '11:00:00', '11:50:00', 'B5');
    insWed11 = searchInstructor('Wed', '11:00:00', '11:50:00', 'B5');
    wed12 = searchCourse('Wed', '12:00:00', '12:50:00', 'B5');
    insWed12 = searchInstructor('Wed', '12:00:00', '12:50:00', 'B5');
    wed2 = searchCourse('Wed', '14:00:00', '14:50:00', 'B5');
    insWed2 = searchInstructor('Wed', '14:00:00', '14:50:00', 'B5');
    wed3 = searchCourse('Wed', '15:00:00', '15:50:00', 'B5');
    insWed3 = searchInstructor('Wed', '15:00:00', '15:50:00', 'B5');
    wed4 = searchCourse('Wed', '16:00:00', '16:50:00', 'B5');
    insWed4 = searchInstructor('Wed', '16:00:00', '16:50:00', 'B5');

    //Thursday
    thu8 = searchCourse('Thu', '08:00:00', '08:50:00', 'B5');
    insThu8 = searchInstructor('Thu', '08:00:00', '08:50:00', 'B5');
    thu9 = searchCourse('Thu', '09:00:00', '09:50:00', 'B5');
    insThu9 = searchInstructor('Thu', '09:00:00', '09:50:00', 'B5');
    thu10 = searchCourse('Thu', '10:00:00', '10:50:00', 'B5');
    insThu10 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');
    thu11 = searchCourse('Thu', '11:00:00', '11:50:00', 'B5');
    insThu11 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');
    thu12 = searchCourse('Thu', '12:00:00', '12:50:00', 'B5');
    insThu12 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');
    thu2 = searchCourse('Thu', '14:00:00', '14:50:00', 'B5');
    insThu2 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');
    thu3 = searchCourse('Thu', '15:00:00', '15:50:00', 'B5');
    insThu3 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');
    thu4 = searchCourse('Thu', '16:00:00', '16:50:00', 'B5');
    insThu4 = searchInstructor('Thu', '10:00:00', '10:50:00', 'B5');

    return 'Routine has been initialized';
  }

  String searchCourse(
      String dName, String beginTime, String endTime, String semester) {
    print('length: ${_weekRoutine.length}');
    for (int i = 0; i < _weekRoutine.length; i++) {
      if (dName == _weekRoutine[i].dayName &&
          semester == _weekRoutine[i].semester &&
          (beginTime == _weekRoutine[i].beginTime ||
              endTime == _weekRoutine[i].endTime)) {
        return _weekRoutine[i].courseCode;
      }
    }
    return '';
  }

  String searchInstructor(
      String dName, String beginTime, String endTime, String semester) {
    for (int i = 0; i < _weekRoutine.length; i++) {
      if (dName == _weekRoutine[i].dayName &&
          semester == _weekRoutine[i].semester &&
          (beginTime == _weekRoutine[i].beginTime ||
              endTime == _weekRoutine[i].endTime)) {
        return _weekRoutine[i].fkInstructorId;
      }
    }
    return '';
  }
}
