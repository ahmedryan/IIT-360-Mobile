library iit_app_development.globals;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:iitappdevelopment/Model/model_cr.dart';
import 'package:iitappdevelopment/Model/model_iitian.dart';

bool isLoggedIn = false;
bool isCR = false;
FirebaseUser user;
List<IITIAN> iitianListGlobal;
List<CR> crListGlobal;
var sharedPreference;

int testing;
