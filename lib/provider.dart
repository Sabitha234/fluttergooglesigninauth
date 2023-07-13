import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninProvider extends ChangeNotifier{
  final _googleSignin=GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user=>_user!;

  Future googleLogin() async{
    try {
      final google_user = await _googleSignin.signIn();
      if (google_user == null) {
        return;
      }
        _user = google_user;
      final google_auth = await google_user!.authentication;
      final credentials = GoogleAuthProvider.credential(
          idToken: google_auth.idToken,
          accessToken: google_auth.accessToken
      );
      await FirebaseAuth.instance.signInWithCredential(credentials);
    }
    catch(e){
      print(e.toString());
    }
     notifyListeners();
  }
Future logout() async{
    await _googleSignin.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
}
}
