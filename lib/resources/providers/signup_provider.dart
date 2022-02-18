import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybloclogin/helpers/data.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/models/signup_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class SignUpProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  //creating signupmodel obj
  //SignupModel _objSignupModel = SignupModel();

  //create local storage obj

  LocalStoreageHelper _localStoreageHelper = LocalStoreageHelper();

  Future<SignupModel> SignUpProviderFun({required String email, required String password})async{

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final emailid=_auth.currentUser!.email;
      ToastPrinter(_auth.currentUser!.email.toString());
      print("Current User"+_auth.currentUser.toString());
      //assigning data to signupmodel using obj
      /*_objSignupModel.isSignup = "true";
        _objSignupModel.isError = "false";*/

      ToastPrinter("SignUp Successfully!");

      //adding data to local storage
      _localStoreageHelper.addItemsToLocalStorage("isSignup:", "true");
      _localStoreageHelper.addItemsToLocalStorage("isError:", "false");
      _localStoreageHelper.addItemsToLocalStorage("response:", _auth.currentUser.toString());


      return SignupModel(emailid);

    } on FirebaseAuthException catch (e) {
      var msg  = e.message;
      ToastPrinter(msg.toString());

      //assigning data to signupmodel using obj
      /*_objSignupModel.isSignup = "false";
        _objSignupModel.isError = "true";*/


      //adding data to local storage
      _localStoreageHelper.addItemsToLocalStorage("isSignup:", "false");
      _localStoreageHelper.addItemsToLocalStorage("isError:", "true");

      return SignupModel("false");
    }
    }
  }
