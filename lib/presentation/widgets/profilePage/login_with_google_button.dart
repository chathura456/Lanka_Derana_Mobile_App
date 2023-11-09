import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginWithGoogleButton({super.key, required this.onPressed});

  Future<void> signWithGoogle() async {
    // create an instance of the firebase auth and google sign
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // triger the auth flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // obtain the auth details from the req
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: signWithGoogle,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 10.0),
            const Text(
              'Login with Google',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
