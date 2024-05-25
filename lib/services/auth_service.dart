import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signWithGoogle() async {
    try {
      // initial proccess to google sign in
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // obtain details account
      final GoogleSignInAuthentication googleAuthentication =
          await googleUser!.authentication;

      // create a new credential to user request
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }
}
