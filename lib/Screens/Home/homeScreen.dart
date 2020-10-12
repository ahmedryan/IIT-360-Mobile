import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_academic_gs.dart';
import 'package:iitappdevelopment/API_Call/call_academic_tp.dart';
import 'package:iitappdevelopment/API_Call/call_academic_ugs.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_screen.dart';

import 'AboutIIT/Faculty/faculty_screen.dart';
import 'AboutIIT/history_screen.dart';
import 'AboutIIT/institution_screen.dart';
import 'AboutIIT/objective_screen.dart';
import 'AboutIIT/staff_screen.dart';
import 'Academic/academic_section_screen.dart';
import 'LifeInIIT/screen_achievement.dart';
import 'LifeInIIT/screen_event_previous.dart';
import 'LifeInIIT/screen_event_upcoming.dart';
import 'Research/screen_publication.dart';
import 'Research/screen_research.dart';
import 'Research/screen_research_area.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(
            "IITDU",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
          pinned: true,
          floating: true,
          snap: true,
          stretch: true,
          backgroundColor: Colors.blue.withOpacity(0.5),
          //backgroundColor: Color(0xFF5CA0D3),
          //backgroundColor: Color(0xFF30359F).withOpacity(0.9),
          expandedHeight: 50,
        ),
        SliverFixedExtentList(
          itemExtent: 278,
          delegate: SliverChildListDelegate(
            [
              _aboutIITWidget(),
              _academicWidget(),
              _noticeWidget(),
              _lifeInIITWidget(),
              _researchWidget(),
            ],
          ),
        )
      ],
    );
  }
}

Widget _aboutIITWidget() {
  return Container(
    width: 200,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IndexCard(
          title: 'ABOUT IIT',
          color: Color(0xFFC04870),
        ),
        ContentCard(
          title: 'Institution',
          imagePath: 'images/institution.jpg',
          nextScreen: InstitutionScreen(),
        ),
        ContentCard(
          title: 'Objective',
          imagePath: 'images/objective.jpg',
          nextScreen: ObjectiveScreen(),
        ),
        ContentCard(
          title: 'History',
          imagePath: 'images/history.jpg',
          nextScreen: HistoryScreen(),
        ),
        ContentCard(
          title: 'Faculty',
          imagePath: 'images/faculty.jpg',
          nextScreen: FacultyScreen(),
        ),
        ContentCard(
          title: 'Staff',
          imagePath: 'images/staff.jpg',
          nextScreen: StaffScreen(),
        ),
      ],
    ),
  );
}

Widget _academicWidget() {
  return Container(
    width: 200,
    height: 300,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IndexCard(
          title: 'ACADEMIC',
          color: Color(0xFFF0B840),
        ),
        ContentCard(
          title: 'Undergraduate Studies',
          imagePath: 'images/undergraduateA.jpg',
          nextScreen: AcademicSectionScreen(fetchAcademicUGS()),
        ),
        ContentCard(
          title: 'Graduate Studies',
          imagePath: 'images/graduateA.jpg',
          nextScreen: AcademicSectionScreen(fetchAcademicGS()),
        ),
        ContentCard(
          title: 'Training Programs',
          imagePath: 'images/trainingA.jpg',
          nextScreen: AcademicSectionScreen(fetchAcademicTP()),
        ),
      ],
    ),
  );
}

Widget _noticeWidget() {
  return Container(
    width: 200,
    height: 300,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IndexCard(
          title: 'NOTICES',
          color: Color(0xFF9078D8),
        ),
        ContentCard(
          title: 'General',
          imagePath: 'images/general.jpg',
          nextScreen: GeneralNoticeScreen(),
        ),
        ContentCard(
          title: 'Projects',
          imagePath: 'images/project.jpg',
          nextScreen: ProjectNoticeScreen(),
        ),
        ContentCard(
          title: 'Undergraduate Studies',
          imagePath: 'images/undergraduateN.jpg',
          nextScreen: UGSNoticeScreen(),
        ),
        ContentCard(
          title: 'Graduate Studies',
          imagePath: 'images/graduateN.jpg',
          nextScreen: GSNoticeScreen(),
        ),
        ContentCard(
          title: 'Training Programs',
          imagePath: 'images/trainingN.jpg',
          nextScreen: TPNoticeScreen(),
        ),
      ],
    ),
  );
}

Widget _lifeInIITWidget() {
  return Container(
    width: 200,
    height: 300,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IndexCard(
          title: 'LIFE IN IIT',
          color: Color(0xFF30B898),
        ),
        ContentCard(
          title: 'News & Events',
          imagePath: 'images/news.jpg',
          nextScreen: PreviousEventScreen(),
        ),
        ContentCard(
          title: 'Achievements',
          imagePath: 'images/achievement.jpg',
          nextScreen: AchievementScreen(),
        ),
        ContentCard(
          title: 'Upcoming Events',
          imagePath: 'images/event.jpg',
          nextScreen: UpcomingEventScreen(),
        ),
      ],
    ),
  );
}

Widget _researchWidget() {
  return Container(
    width: 200,
    height: 300,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        IndexCard(
          title: 'RESEARCH',
          color: Color(0xFF606060),
        ),
        ContentCard(
          title: 'Research',
          imagePath: 'images/research.jpg',
          nextScreen: ResearchScreen(),
        ),
        ContentCard(
          title: 'Publications',
          imagePath: 'images/publication.jpg',
          nextScreen: PublicationScreen(),
        ),
        ContentCard(
          title: 'Research Area',
          imagePath: 'images/researchA.jpg',
          nextScreen: ResearchAreaScreen(),
        ),
      ],
    ),
  );
}

class IndexCard extends StatelessWidget {
  final String title;
  final Color color;

  IndexCard({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget nextScreen;

  ContentCard({this.title, this.imagePath, this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Card(
        child: Container(
          width: 180,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 210,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.black45.withOpacity(0.5),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 205,
                  ),
                  Container(
                    height: 65,
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
