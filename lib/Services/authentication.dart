import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

class MyAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  //Checking if loggedIn
  Future<void> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    global.user = user;
    if (user != null)
      global.isLoggedIn = true;
    else
      global.isLoggedIn = false;

    print('User status: ${global.isLoggedIn}');
  }

  //Checking whether Iitian
  Future isUserIitian() async {
    for (int i = 0; i < global.iitianListGlobal.length; i++) {
      if (global.iitianListGlobal[i].iitianMail == global.user.email) {
        global.isLoggedIn = true;
        return;
      }
    }
    await handleSignOut();
  }

  //Checking whether CR
  void isUserCR() {
    for (int i = 0; i < global.crListGlobal.length; i++) {
      if (global.crListGlobal[i].crMailId == global.user.email)
        global.isCR = true;
    }
  }

  //Signing in
  Future handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    global.user = result.user;

    print('Logged In');
  }

  //Signing out
  Future handleSignOut() async {
    await _auth.signOut().then(
      (value) async {
        await _googleSignIn.signOut();
        global.user = null;
        global.isLoggedIn = false;
        global.isCR = false;
      },
    );
    print('Logged Out');
  }
}
