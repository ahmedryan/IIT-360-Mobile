import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/Model/model_cr.dart';
import 'package:iitappdevelopment/Model/model_iitian.dart';
import 'package:iitappdevelopment/Screens/Dashboard/DashboardScreen.dart';
import 'package:iitappdevelopment/Services/cr_initialization.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;
import 'package:iitappdevelopment/Services/iitian_initialization.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  loadIITIAN();
  loadCR();
  isUserLoggedIn();

  runApp(
    MaterialApp(
      home: DashboardScreen(),
    ),
  );
}

Future<void> isUserLoggedIn() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var user = await _auth.currentUser();
  if (user != null) {
    global.user = user;
    global.isLoggedIn = true;
  } else
    global.isLoggedIn = false;
}

void loadIITIAN() async {
  global.iitianListGlobal = List<IITIAN>();

  IITIANInitialization a = IITIANInitialization();
  await a.initialize();
  global.iitianListGlobal = a.getIITIAN();
}

void loadCR() async {
  global.crListGlobal = List<CR>();

  CRInitialization a = CRInitialization();
  await a.initialize();
  global.crListGlobal = a.getCR();
}
