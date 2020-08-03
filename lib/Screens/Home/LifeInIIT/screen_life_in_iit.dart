import 'package:flutter/material.dart';
import 'package:iitappdevelopment/Screens/Home/LifeInIIT/screen_achievement.dart';
import 'package:iitappdevelopment/Screens/Home/LifeInIIT/screen_event_previous.dart';
import 'package:iitappdevelopment/Screens/Home/LifeInIIT/screen_event_upcoming.dart';

class LifeInIITScreen extends StatefulWidget {
  @override
  _LifeInIITScreenState createState() => _LifeInIITScreenState();
}

class _LifeInIITScreenState extends State<LifeInIITScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(text: 'News & Events'),
            Tab(text: 'Achievements'),
            Tab(text: 'Upcoming Events'),
          ]),
        ),
        body: TabBarView(children: [
          PreviousEventScreen(),
          AchievementScreen(),
          UpcomingEventScreen(),
        ]),
      ),
    );
  }
}
