import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocalNotificationScreen(),
    );
  }
}

class LocalNotificationScreen extends StatefulWidget {
  @override
  _LocalNotificationScreenState createState() =>
      _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Here is my payload'),
        content: Text("Payload: $payload"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
//              new RaisedButton(
//                onPressed: _showNotificationWithSound,
//                child: new Text('Show Notification With Sound'),
//              ),
//              new SizedBox(
//                height: 30.0,
//              ),
//              new RaisedButton(
//                onPressed: _showNotificationWithoutSound,
//                child: new Text('Show Notification Without Sound'),
//              ),
//              new SizedBox(
//                height: 30.0,
//              ),
              new RaisedButton(
                onPressed: _showNotificationWithDefaultSound,
                child: new Text('Show Notification With Default Sound'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
}

//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: LocalNotificationScreen(),
//    );
//  }
//}
//
//class LocalNotificationScreen extends StatefulWidget {
//  @override
//  _LocalNotificationScreenState createState() =>
//      _LocalNotificationScreenState();
//}
//
//class _LocalNotificationScreenState extends State<LocalNotificationScreen> {
//  NotificationPlugin notificationPlugin = NotificationPlugin._();
//
//  onNotificationClick(String payload) {
//    print('Payload $payload');
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    notificationPlugin.setOnNotificationClick(onNotificationClick);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Local Notification'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () async {
//            await notificationPlugin.showNotification();
//          },
//          child: Text('Send My Notification'),
//        ),
//      ),
//    );
//  }
//}
//
//class NotificationPlugin {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//  var initializationSettings;
//
//  NotificationPlugin._() {
//    init();
//  }
//
//  NotificationPlugin notificationPlugin = NotificationPlugin._();
//
//  init() async {
//    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//    if (Platform.isIOS) {
//      _requestIOSPermission();
//    }
//  }
//
//  initializePlatformSpecifics() {
//    var initializationSettingsAndroid =
//        AndroidInitializationSettings('ic_launcher');
//    var initializationSettingsIOS = IOSInitializationSettings(
//      requestAlertPermission: true,
//      requestBadgePermission: true,
//      requestSoundPermission: false,
//      onDidReceiveLocalNotification: (id, title, body, payload) async {},
//    );
//
//    var initializationSettings = InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//  }
//
//  _requestIOSPermission() {
//    flutterLocalNotificationsPlugin
//        .resolvePlatformSpecificImplementation<
//            IOSFlutterLocalNotificationsPlugin>()
//        .requestPermissions(
//          alert: false,
//          badge: true,
//          sound: true,
//        );
//  }
//
//  setOnNotificationClick(Function onNotificationClick) async {
//    await flutterLocalNotificationsPlugin.initialize(
//      initializationSettings,
//      onSelectNotification: (String payload) async {
//        onNotificationClick(payload);
//      },
//    );
//  }
//
//  Future<void> showNotification() async {
//    var androidChannelSpecifics = AndroidNotificationDetails(
//        'Channel_ID', 'Channel_Name', 'Channel_Description',
//        importance: Importance.Max, priority: Priority.High);
//    var iosChannelSpecifics = IOSNotificationDetails();
//    var platformChannelSpecifics =
//        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//      0,
//      'Test Title',
//      'Test_Body',
//      platformChannelSpecifics,
//      payload: 'Test Payload',
//    );
//  }
//}

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:iitappdevelopment/Services/global_variable.dart' as global;
//
////File: main
//Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//
//  isUserLoggedIn();
//
//  runApp(
//    MaterialApp(
//      home: DashboardScreen(),
//    ),
//  );
//}
//
//Future<void> isUserLoggedIn() async {
//  FirebaseAuth _auth = FirebaseAuth.instance;
//  GoogleSignIn _googleSignIn = new GoogleSignIn();
//
//  var user = await _auth.currentUser();
//  if (user != null) {
//    global.user = user;
//    global.isLoggedIn = true;
//  } else
//    global.isLoggedIn = false;
//}
//
////File: Home
//class DashboardScreen extends StatefulWidget {
//  @override
//  _DashboardScreenState createState() => _DashboardScreenState();
//}
//
//class _DashboardScreenState extends State<DashboardScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: Drawer(),
//      body: CustomScrollView(
//        slivers: <Widget>[
//          SliverAppBar(
//            title: Text(
//              "IITDU",
//              style: TextStyle(color: Color(0xFFFFFFFF)),
//            ),
//            pinned: true,
//            floating: true,
//            snap: true,
//            stretch: true,
//            backgroundColor: Colors.blue.withOpacity(0.5),
//            //backgroundColor: Color(0xFF5CA0D3),
//            //backgroundColor: Color(0xFF30359F).withOpacity(0.9),
//            expandedHeight: 50,
//          ),
//          SliverFixedExtentList(
//            itemExtent: 278,
//            delegate: SliverChildListDelegate([
//              _aboutIITWidget(),
//              _academicWidget(),
//              _noticeWidget(),
//              _lifeInIITWidget(),
//              _researchWidget(),
//
//              ///add more as you wish
//            ]),
//          )
//        ],
//      ),
//    );
//  }
//
//  _aboutIITWidget() {
//    return Container(
//      width: 200,
//      child: ListView(
//        shrinkWrap: true,
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          IndexCard(
//            title: 'ABOUT IIT',
//            color: Color(0xFFC04870),
//          ),
//          ContentCard(
//            title: 'Institution',
//            imagePath: 'images/institution.jpg',
//          ),
//          ContentCard(
//            title: 'Objective',
//            imagePath: 'images/objective.jpg',
//          ),
//          ContentCard(
//            title: 'History',
//            imagePath: 'images/history.jpg',
//          ),
//          ContentCard(
//            title: 'Faculty',
//            imagePath: 'images/faculty.jpg',
//          ),
//          ContentCard(
//            title: 'Staff',
//            imagePath: 'images/staff.jpg',
//          ),
//        ],
//      ),
//    );
//  }
//
//  _academicWidget() {
//    return Container(
//      width: 200,
//      height: 300,
//      child: ListView(
//        shrinkWrap: true,
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          IndexCard(
//            title: 'ACADEMIC',
//            color: Color(0xFFF0B840),
//          ),
//          ContentCard(
//            title: 'Undergraduate Studies',
//            imagePath: 'images/undergraduateA.jpg',
//          ),
//          ContentCard(
//            title: 'Graduate Studies',
//            imagePath: 'images/graduateA.jpg',
//          ),
//          ContentCard(
//            title: 'Training Programs',
//            imagePath: 'images/trainingA.jpg',
//          ),
//        ],
//      ),
//    );
//  }
//
//  _noticeWidget() {
//    return Container(
//      width: 200,
//      height: 300,
//      child: ListView(
//        shrinkWrap: true,
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          IndexCard(
//            title: 'NOTICES',
//            color: Color(0xFF9078D8),
//          ),
//          ContentCard(
//            title: 'General',
//            imagePath: 'images/general.jpg',
//          ),
//          ContentCard(
//            title: 'Projects',
//            imagePath: 'images/project.jpg',
//          ),
//          ContentCard(
//            title: 'Undergraduate Studies',
//            imagePath: 'images/undergraduateN.jpg',
//          ),
//          ContentCard(
//            title: 'Graduate Studies',
//            imagePath: 'images/graduateN.jpg',
//          ),
//          ContentCard(
//            title: 'Training Programs',
//            imagePath: 'images/trainingN.jpg',
//          ),
//        ],
//      ),
//    );
//  }
//
//  _lifeInIITWidget() {
//    return Container(
//      width: 200,
//      height: 300,
//      child: ListView(
//        shrinkWrap: true,
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          IndexCard(
//            title: 'LIFE IN IIT',
//            color: Color(0xFF30B898),
//          ),
//          ContentCard(
//            title: 'News & Events',
//            imagePath: 'images/news.jpg',
//          ),
//          ContentCard(
//            title: 'Achievements',
//            imagePath: 'images/achievement.jpg',
//          ),
//          ContentCard(
//            title: 'Upcoming Events',
//            imagePath: 'images/event.jpg',
//          ),
//        ],
//      ),
//    );
//  }
//
//  _researchWidget() {
//    return Container(
//      width: 200,
//      height: 300,
//      child: ListView(
//        shrinkWrap: true,
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          IndexCard(
//            title: 'RESEARCH',
//            color: Color(0xFF606060),
//          ),
//          ContentCard(
//            title: 'Research',
//            imagePath: 'images/research.jpg',
//          ),
//          ContentCard(
//            title: 'Publications',
//            imagePath: 'images/publication.jpg',
//          ),
//          ContentCard(
//            title: 'Research Area',
//            imagePath: 'images/researchA.jpg',
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class IndexCard extends StatelessWidget {
//  final String title;
//  final Color color;
//
//  IndexCard({this.title, this.color});
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Stack(
//        children: [
//          Container(
//            width: 180,
//            decoration: BoxDecoration(
//              color: color,
//              borderRadius: BorderRadius.circular(4.0),
//            ),
//          ),
//          Align(
//            alignment: Alignment.centerLeft,
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text(
//                title,
//                softWrap: true,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 25,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class ContentCard extends StatelessWidget {
//  final String title;
//  final String subtitle;
//  final String imagePath;
//
//  ContentCard({this.title, this.subtitle, this.imagePath});
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Container(
//        width: 180,
//        child: Stack(
//          children: [
//            ClipRRect(
//              borderRadius: BorderRadius.circular(4.0),
//              clipBehavior: Clip.antiAlias,
//              child: Image.asset(
//                imagePath,
//              ),
//            ),
//            Column(
//              children: [
//                SizedBox(
//                  height: 210,
//                ),
//                Container(
//                  height: 60,
//                  width: double.infinity,
//                  color: Colors.black45.withOpacity(0.5),
//                ),
//              ],
//            ),
//            Column(
//              children: [
//                SizedBox(
//                  height: 205,
//                ),
//                Container(
//                  height: 65,
//                  child: Material(
//                    color: Colors.transparent,
//                    clipBehavior: Clip.antiAlias,
//                    child: Padding(
//                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
//                      child: Align(
//                        alignment: Alignment.centerLeft,
//                        child: Text(
//                          title,
//                          softWrap: true,
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 18,
//                            fontWeight: FontWeight.w600,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
