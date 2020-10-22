import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_academic_gs.dart';
import 'package:iitappdevelopment/API_Call/call_academic_tp.dart';
import 'package:iitappdevelopment/API_Call/call_academic_ugs.dart';
import 'package:iitappdevelopment/Screens/Home/Academic/academic_section_screen.dart';

class AcademicScreen extends StatefulWidget {
  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Academic'),
          bottom: TabBar(tabs: [
            Tab(text: 'Undergraduate'),
            Tab(text: 'Graduate'),
            Tab(text: 'Training'),
          ]),
        ),
        body: TabBarView(
          children: [
            AcademicSectionScreen(fetchAcademicUGS()),
            AcademicSectionScreen(fetchAcademicGS()),
            AcademicSectionScreen(fetchAcademicTP()),
          ],
        ),
      ),
    );
  }
}
