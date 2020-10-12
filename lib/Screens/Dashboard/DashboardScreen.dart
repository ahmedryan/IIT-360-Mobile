import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iitappdevelopment/Screens/Calendar/calendarScreen.dart';
import 'package:iitappdevelopment/Screens/Drawer/ChangeRoutine/change_routine_screen.dart';
import 'package:iitappdevelopment/Screens/Drawer/IndustryScreen/IndustryScreen.dart';
import 'package:iitappdevelopment/Screens/Home/homeScreen.dart';
import 'package:iitappdevelopment/Screens/Routine/routine_screen.dart';
import 'package:iitappdevelopment/Services/android_activity.dart';
import 'package:iitappdevelopment/Services/authentication.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  MyAuthentication _myAuthentication;
  bool _isLoggedIn;
  bool _isCr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myAuthentication = new MyAuthentication();
    _isLoggedIn = global.isLoggedIn;
    _isCr = global.isCR;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              if (_isLoggedIn)
                UserAccountsDrawerHeader(
                  accountName: Text(global.user.displayName),
                  accountEmail: Text(global.user.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(global.user.photoUrl),
                  ),
                ),
              if (!_isLoggedIn)
                UserAccountsDrawerHeader(
                    accountName: Text(''), accountEmail: Text('')),
              if (_isLoggedIn)
                ListTile(
                    leading: Icon(Icons.sentiment_very_dissatisfied),
                    title: new Text("Routine"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutineScreen(),
                        ),
                      );
                    }),
              if (_isCr)
                ListTile(
                    leading: Icon(Icons.add_comment),
                    title: new Text("Change Routine"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeRoutine(),
                        ),
                      );
                    }),
              if (_isLoggedIn)
                ListTile(
                    leading: Icon(Icons.alarm),
                    title: new Text("Alarm"),
                    onTap: () {
                      AndroidActivity().getAlarmActivity();
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => AlarmScreen(),
//                        ),
//                      );
                    }),
              if (_isLoggedIn)
                ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: new Text("Calendar"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarScreen(),
                        ),
                      );
                    }),
              ListTile(
                  leading: Icon(Icons.work),
                  title: new Text("Industry"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndustryScreen(),
                      ),
                    );
                  }),
              if (_isLoggedIn)
                ListTile(
                    leading: Icon(Icons.account_circle),
                    title: new Text("Logout"),
                    onTap: () {
                      _myAuthentication.handleSignOut().then((value) {
                        setState(() {
                          _isLoggedIn = false;
                          _isCr = false;
                        });
                      });
                    }),
              if (!_isLoggedIn)
                ListTile(
                    leading: Icon(Icons.account_circle),
                    title: new Text("Login"),
                    onTap: () {
                      _myAuthentication.handleSignIn().then((value) {
                        _myAuthentication.isUserIitian().then((value) {
                          _myAuthentication.isUserCR();
                          setState(() {
                            _isLoggedIn = global.isLoggedIn;
                            _isCr = global.isCR;
                          });
                        });
                      });
                    }),
            ],
          ),
        ), // Populate the Drawer in the next step.
      ),
      body: HomeScreen(),
    );
  }
}

//int _selectedTabIndex = 0;
//
//List<Widget> _pages = <Widget>[
//  HomeScreen(),
//  RoutineScreen(),
//  AlarmScreen(),
//  CalendarScreen()
//];
//
//_changeIndex(int index) {
//  setState(() {
//    _selectedTabIndex = index;
//    print(_selectedTabIndex);
//  });
//}

//appBar: AppBar(
//backgroundColor: Colors.blue.withOpacity(0.5),
//toolbarOpacity: 0.8,
//),
//body: _pages[_selectedTabIndex],
//bottomNavigationBar: BottomNavigationBar(
//type: BottomNavigationBarType.fixed,
//currentIndex: _selectedTabIndex,
//unselectedFontSize: 13,
//selectedFontSize: 15,
//backgroundColor: Color(0xFFFFFFFF),
//items: <BottomNavigationBarItem>[
//BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//BottomNavigationBarItem(
//icon: Icon(Icons.assignment), title: Text('Routine')),
//BottomNavigationBarItem(
//icon: Icon(Icons.alarm), title: Text('Alarm')),
//BottomNavigationBarItem(
//icon: Icon(Icons.calendar_today), title: Text('Calender')),
//],
//selectedItemColor: Colors.blue[800],
//onTap: _changeIndex,
//),
