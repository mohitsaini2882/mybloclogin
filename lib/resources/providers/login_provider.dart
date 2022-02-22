import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/models/login_model.dart';

class LoginProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  LocalStoreageHelper _localStoreageHelper = LocalStoreageHelper();

  /*Future<LoginModel> */LoginProviderFun({required String email, required String password})async{

      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        PrintToast("SignedIn Successfully!");
        _localStoreageHelper.clearAllData();
        _localStoreageHelper.addItemsToLocalStorage("isLoggedIn:", "true");
        _localStoreageHelper.addItemsToLocalStorage("currentUser:", _auth.currentUser.toString());
        _localStoreageHelper.addItemsToLocalStorage("emailId:", _auth.currentUser!.email.toString());
         print("uid by login time :::"+_auth.currentUser!.uid);
        _localStoreageHelper.addItemsToLocalStorage("uid:", _auth.currentUser!.uid.toString());
        return LoginModel(isErrorInLogin: "false",isLoggedIn: "true");
      } on FirebaseAuthException catch (e) {
        var msg  = e.message;
        PrintToast(msg.toString());
        _localStoreageHelper.addItemsToLocalStorage("isLoggedIn:", "false");
        return LoginModel(isErrorInLogin: "true",isLoggedIn: "false");
      }
  }
}