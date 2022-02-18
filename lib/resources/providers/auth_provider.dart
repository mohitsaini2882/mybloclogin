import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybloclogin/helpers/toast.dart';

class AuthenticationHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ToastPrinter("SignUp Successfully!");
      return null;
    } on FirebaseAuthException catch (e) {
      var msg  = e.message;
      ToastPrinter(msg.toString());
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ToastPrinter("SignedIn Successfully!");
      return null;
    } on FirebaseAuthException catch (e) {
      var msg  = e.message;
      ToastPrinter(msg.toString());
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    try{
      await _auth.signOut();
      ToastPrinter("Sign Out Successfully!");
      print('signout');
    } on FirebaseAuthException catch (e){
      var msg = e.message;
      ToastPrinter(msg.toString());
    }
  }
}