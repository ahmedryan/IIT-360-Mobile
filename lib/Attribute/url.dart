class URL {
  static String host = 'https://iit360api20200630172203.azurewebsites.net';

  //About IIT
  String institutionURL = '$host/api/Institutions';
  String objectiveURL = '$host/api/Anos';
  String historyURL = '$host/api/Histories';
  String facultyURL = '$host/api/Faculties';
  String staffURL = '$host/api/Staffs';

  //Academic
  String academicGSURL = '$host/api/Academics/GetAcademic/GS';
  String academicTPURL = '$host/api/Academics/GetAcademic/TP';
  String academicUGSURL = '$host/api/Academics/GetAcademic/UGS';

  //Notice
  String scholarshipNoticeUrl = '$host/api/Notices/GetNotice/scholarship';
  String registrarOffice = '$host/api/Notices/GetNotice/registrarOffice';

  String projectNoticeUrl = '$host/api/Notices/GetNotice/project';

  String bsseNoticeUrl = '$host/api/Notices/GetNotice/bsse';

  String msseNoticeUrl = '$host/api/Notices/GetNotice/msse';
  String mitNoticeUrl = '$host/api/Notices/GetNotice/mit';
  String pgditNoticeUrl = '$host/api/Notices/GetNotice/pgdit';

  String webDesignUrl = '$host/api/Notices/GetNotice/webDesign';
  String webProgrammingUrl = '$host/api/Notices/GetNotice/webProgramming';
  String officeApplicationUrl =
      '$host/api/Notices/GetNotice/officeApplications';
  String matlabOriginLatexUrl = '$host/api/Notices/GetNotice/matlabOriginLatex';
  String mobileApplicationUrl = '$host/api/Notices/GetNotice/mobileApplication';

  //Life in IIT
  String eventPreviousURL = '$host/api/Events/Previous';
  String eventUpcomingURL = '$host/api/Events/Upcoming';
  String achievementURL = '$host/api/Achievements';

  //Research
  String publicationURL = '$host/api/Publications/GetPublication';
  String researchURL = '$host/api/Researches/GetResearch';
  String researchAreaURL = '$host/api/Researchareas';

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
