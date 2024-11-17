// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guerba_app/login_page.dart';
import 'package:guerba_app/welcome_page.dart';

// import '../pages/home/home.dart';
// import '../pages/login/login.dart';

class AuthService {


  Future<void> signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
    
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) =>  LoginPage()));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {}
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Extract the signed-in user
      final User? firebaseUser = userCredential.user;

      // Navigate to the WelcomePage
      if (firebaseUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WelcomePage(
              firebaseUser: firebaseUser, // Pass Firebase user instead
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An error occurred. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  // Future<void> signout({required BuildContext context}) async {
  //   await FirebaseAuth.instance.signOut();
  //   await Future.delayed(const Duration(seconds: 1));
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  // }
  // Future<void> signout({required BuildContext context}) async {
  //   // Sign out from Firebase
  //   await FirebaseAuth.instance.signOut();
  //   // Wait for the sign-out process to complete (optional)
  //   await Future.delayed(const Duration(seconds: 1));
  //   // Navigation will be handled in the onTap method, so no need here.
  // }


}