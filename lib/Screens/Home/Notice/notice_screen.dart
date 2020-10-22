import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_notice_general.dart';
import 'package:iitappdevelopment/Model/model_notice.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_bsse_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_design_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_matlab_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_mit_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_mobile_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_msse_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_office_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_pgdit_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_programming_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_project_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_registrar_screen.dart';
import 'package:iitappdevelopment/Screens/Home/Notice/notice_scholarship_screen.dart';
import 'package:iitappdevelopment/Services/readable_date.dart';

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<NoticeScreen> {
  Future<List<Notice>> futureNotice;

  @override
  void initState() {
    super.initState();
    futureNotice = fetchNoticeOffice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notices'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureNotice,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Notice notice = snapshot.data[index];

                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${notice.section}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                    ReadableDate.convertDate('${notice.date}')),
                                Text('${notice.time}'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${notice.title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  '${notice.description}',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${notice.fkNoticeDocument}',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class GeneralNoticeScreen extends StatefulWidget {
  @override
  _GeneralNoticeScreenState createState() => _GeneralNoticeScreenState();
}

class _GeneralNoticeScreenState extends State<GeneralNoticeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("General Notice"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Scholarship'),
                Tab(text: 'Registrar Office'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                NoticeScholarshipScreen(),
                NoticeRegistrarScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectNoticeScreen extends StatefulWidget {
  @override
  _ProjectNoticeScreenState createState() => _ProjectNoticeScreenState();
}

class _ProjectNoticeScreenState extends State<ProjectNoticeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 1,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Project Notice"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Project'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                NoticeProjectScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UGSNoticeScreen extends StatefulWidget {
  @override
  _UGSNoticeScreenState createState() => _UGSNoticeScreenState();
}

class _UGSNoticeScreenState extends State<UGSNoticeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 1,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Undergraduate Studies Notice"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'BSSE'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                NoticeBsseScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GSNoticeScreen extends StatefulWidget {
  @override
  _GSNoticeScreenState createState() => _GSNoticeScreenState();
}

class _GSNoticeScreenState extends State<GSNoticeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Graduate Studies Notice"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'MSSE'),
                Tab(text: 'MIT'),
                Tab(text: 'PGDIT'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                NoticeMsseScreen(),
                NoticeMitScreen(),
                NoticePgditScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TPNoticeScreen extends StatefulWidget {
  @override
  _TPNoticeScreenState createState() => _TPNoticeScreenState();
}

class _TPNoticeScreenState extends State<TPNoticeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("General Notice"),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Web Design'),
                Tab(text: 'Web Programming'),
                Tab(text: 'Office Applications'),
                Tab(text: 'Matlab-Origin-LaTeX'),
                Tab(text: 'Mobile Application'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                NoticeDesignScreen(),
                NoticeProgrammingScreen(),
                NoticeOfficeScreen(),
                NoticeMatlabScreen(),
                NoticeMobileScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
