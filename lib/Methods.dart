import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

Future<User> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password));

    if (user != null) {
      print("Account created Succesfull");

      return Future.value(user.user);
    } else {
      print("Account creation failed");
      return Future.value(user.user);
    }
  } catch (e) {
    print(e);
    //return null;
  }
  return null;
}

Future<User> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    UserCredential user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password));

    if (user != null) {
      print("Login Sucessfull");
      return Future.value(user.user);
    } else {
      print("Login Failed");
      return Future.value(user.user);
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}
