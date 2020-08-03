// Sliver appbar with tabs.
// Adapted from: https://stackoverflow.com/a/50858058

import 'package:flutter/material.dart';
import 'package:iitappdevelopment/Model/model_faculty.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/Faculty/faculty_project_scholarship_screen.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/Faculty/faculty_publication_screen.dart';
import 'package:iitappdevelopment/Screens/Home/AboutIIT/Faculty/faculty_research_screen.dart';

class FacultyProfileScreen extends StatefulWidget {
  final Faculty facultyProfile;

  FacultyProfileScreen({this.facultyProfile});

  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<FacultyProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 6,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Faculty Profile"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'About Me'),
                Tab(text: 'Projects & Scholarships'),
                Tab(text: 'Research'),
                Tab(text: 'Publications'),
                Tab(text: 'Teachings'),
                Tab(text: 'Contact'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Text('${widget.facultyProfile.aboutMe}'),
                FacultyProjectScholarshipScreen(
                  facultyID: widget.facultyProfile.facultyId,
                ),
                FacultyResearchScreen(
                  facultyID: widget.facultyProfile.facultyId,
                ),
                FacultyPublicationScreen(
                  facultyID: widget.facultyProfile.facultyId,
                ),
                Text('${widget.facultyProfile.aboutMe}'),
                Text("Tab six"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
