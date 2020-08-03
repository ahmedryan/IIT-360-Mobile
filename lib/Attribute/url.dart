class URL {
  static String host = 'https://iit360api20200630172203.azurewebsites.net';

  //About IIT
  String institutionURL = 'http://lit360.000webhostapp.com/institution.php';
  String objectiveURL = 'http://lit360.000webhostapp.com/aimsNobjectives.php';
  String historyURL = 'http://lit360.000webhostapp.com/history.php';
  String facultyURL = 'http://lit360.000webhostapp.com/faculty.php';
  String staffURL = 'http://lit360.000webhostapp.com/staff.php';

  //Academic
  String academicGSURL = '$host/api/Academics/GetAcademic/GS';
  String academicTPURL = '$host/api/Academics/GetAcademic/TP';
  String academicUGSURL = '$host/api/Academics/GetAcademic/UGS';

  //Notice
  String noticeURL = 'http://lit360.000webhostapp.com/notice.php'; //remove it
  String generalNoticeUrl = '$host/api/Notices/GetNotice/General';
  String projectNoticeUrl = '$host/api/Notices/GetNotice/Project';
  String ugsNoticeUrl = '$host/api/Notices/GetNotice/UGS';
  String gsNoticeUrl = '$host/api/Notices/GetNotice/GS';
  String tpNoticeUrl = '$host/api/Notices/GetNotice/TP';

  //Life in IIT
  String eventPreviousURL = '$host/api/Events/Previous';
  String eventUpcomingURL = '$host/api/Events/Upcoming';
  String achievementURL = 'http://lit360.000webhostapp.com/achievement.php';

  //Research
  String publicationURL = '$host/api/Publications/GetPublication';
  String researchURL = 'http://lit360.000webhostapp.com/research.php';
  String researchAreaURL = 'http://lit360.000webhostapp.com/research_area.php';

  //Iitian
  String iitianURL = '$host/api/Iitians';
  String crURL = '$host/api/crs';

  //Faculty Profile
  String facultyPublicationURL = '$host/api/Publications/IndividualPub/';
  String facultyResearchURL = '$host/api/Researches/FacultyResearch/';
  String projectScholarshipURL = '$host/api/ProjectScholarships/Individual/';

  //Routine
  String routineURL = '$host/api/Routines/weekRoutine/';

  //Industry Collaboration
  String industryURL = '$host/api/Industries';

  //Routine Change
  String classCancelURL = '$host/api/Routines/CancelClass/';
  String extraClassURL = '$host/api/Routines/ExtraClass/';
  String swapClassURL = '$host/api/Routines/SwapClass/';
  String rescheduleClassURL = '$host/api/Routines/Reschedule/';
}
