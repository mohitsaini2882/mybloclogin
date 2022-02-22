import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
class FirestoreHelper {
  LocalStoreageHelper _localStoreageHelper = LocalStoreageHelper();
  String? uid;
  asUID(){
    //PrintToast("asUID run");
    uid = _localStoreageHelper.getitemFromLocalStorage("uid:");
    print("uid : " + uid.toString());
  }

  void addData(String tag, String value) {
    if (tag.isNotEmpty && value.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('data')
          .add({tag: value});
    } else {
      ToastPrinter("Check addData parameters not emtpy");
    }
  }

  addWithDoc({required String? documentUID, required String? tag, required Map? yourData}) async {
    await asUID();
    uid = _localStoreageHelper.getitemFromLocalStorage("uid:");
    print("uid : " + uid.toString());
    print("UID received in addWithDoc::: " + documentUID.toString());
   // PrintToast("UID received in addWithDoc::: " + documentUID.toString());
    String? fullname, age, bio;
    fullname = yourData!['FullName'];
    age = yourData['Age'];
    bio = yourData['Bio'];
  //  ToastPrinter("AddWithDoc Run ");
    if (uid == null) {
     // PrintToast("DocumentUID : is null ");
    } else {
      await FirebaseFirestore.instance.collection('users').doc(uid)
          .collection("userdetails")
          .add({"FullName": fullname, "Age": age, "Bio": bio});
    }
  }
    void addWithDoc2(
        {required String? documentUID, required String? tag, required Map? yourData}) async {
      String? fullname, age, bio;
      fullname = yourData!['FullName'];
      age = yourData['Age'];
      bio = yourData['Bio'];
      ToastPrinter("AddWithDoc Run ");
      await FirebaseFirestore.instance.collection('users')
          .doc(documentUID)
          .collection("userdetails")
          .add({"FullName": fullname, "Age": age, "Bio": bio});
    }


    //update function here ---
    void updateData({required String? UID, required Map yourData,}) async {
      String? fullname, age, bio;
      fullname = yourData!['FullName'];
      age = yourData['Age'];
      bio = yourData['Bio'];
      /*var collection = FirebaseFirestore.instance.collection('users');
    //PrintToast(collection.toString());
    collection
        .doc(UID)
        .update({'userdetails' : yourData}) // <-- Nested value
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));*/

      await FirebaseFirestore.instance.collection('users').doc(UID).collection(
          "userdetails").doc('K6osltILwXo72qXpYSMP').update(
          {"FullName": fullname, "Age": age, "Bio": bio
          });
    }
  }

