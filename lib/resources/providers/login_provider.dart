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
        _localStoreageHelper.addItemsToLocalStorage("isLoggedIn:", "true");
        return LoginModel(isErrorInLogin: "false",isLoggedIn: "true");
      } on FirebaseAuthException catch (e) {
        var msg  = e.message;
        PrintToast(msg.toString());
        _localStoreageHelper.addItemsToLocalStorage("isLoggedIn:", "false");
        return LoginModel(isErrorInLogin: "true",isLoggedIn: "false");

      }
  }
}