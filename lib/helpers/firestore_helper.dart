import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybloclogin/helpers/toast.dart';
class FirestoreHelper{
  void addData(String tag,String value){
    if(tag.isNotEmpty && value.isNotEmpty){
      FirebaseFirestore.instance
          .collection('data')
          .add({tag: value});
    }else{
      ToastPrinter("Check addData parameters not emtpy");
    }
  }
  void addWithDoc({required String? documentUID,required String? tag,required Map? yourData})async{
    String? fullname,age,bio;
    fullname = yourData!['FullName'];
    age = yourData['Age'];
    bio = yourData['Bio'];
    await FirebaseFirestore.instance.collection('users').doc(documentUID).collection("userdetails")
    .add({"FullName": fullname,"Age": age,"Bio":bio});
  }
  
  //update function here ---
  void updateData({required String? UID,required Map yourData,})async {
    /*var collection = FirebaseFirestore.instance.collection('users');
    //PrintToast(collection.toString());
    collection
        .doc(UID)
        .update({'userdetails' : yourData}) // <-- Nested value
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));*/
    await FirebaseFirestore.instance.collection('users').doc(UID).collection(
        "userdetails").doc('K6osltILwXo72qXpYSMP').update({
      "FullName": "Monu",
      "Age": '80',
      "Bio": 'Waheguru'
    });
  }

  //getData funtion
}


