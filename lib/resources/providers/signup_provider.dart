import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/models/signup_model.dart';

class SignUpProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  LocalStoreageHelper _localStoreageHelper = LocalStoreageHelper();

  Future<SignupModel> SignUpProviderFun({required String email, required String password})async{
    String? UIDbefore = _localStoreageHelper.getitemFromLocalStorage("uid:");
    print("UID before signup run :::"+UIDbefore.toString());
    PrintToast("UID before signup run :::"+UIDbefore.toString());
    try {
      ToastPrinter("Signup Run");
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final emailid=_auth.currentUser!.email;
      print("UID During Signup:::"+ _auth.currentUser!.uid);
      PrintToast("UID During Signup:::"+ _auth.currentUser!.uid);
      ToastPrinter("SignUp Successfully!");
      //adding data to local storage
      _localStoreageHelper.addItemsToLocalStorage("isSignup:", "true");
      _localStoreageHelper.addItemsToLocalStorage("isError:", "false");
      _localStoreageHelper.addItemsToLocalStorage("response:", _auth.currentUser.toString());
      _localStoreageHelper.addItemsToLocalStorage("currentUser:", _auth.currentUser.toString());
      _localStoreageHelper.addItemsToLocalStorage("emailId:", _auth.currentUser!.email.toString());
      _localStoreageHelper.addItemsToLocalStorage("uid:", _auth.currentUser!.uid.toString());
      //uid value after signup and local store
      String? UIDbefore2 = _localStoreageHelper.getitemFromLocalStorage("uid:");
      print("UID after signup run in local storage :::"+UIDbefore2.toString());
      PrintToast("UID after signup run in local storage :::"+UIDbefore2.toString());
      return SignupModel(emailid);

    } on FirebaseAuthException catch (e) {
      var msg  = e.message;
      ToastPrinter(msg.toString());

      //adding data to local storage
      _localStoreageHelper.addItemsToLocalStorage("isSignup:", "false");
      _localStoreageHelper.addItemsToLocalStorage("isError:", "true");
      return SignupModel("false");
    }
    }
  }
