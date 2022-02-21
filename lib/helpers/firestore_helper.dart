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
  void addWithDoc({required String? documentUID,required String? tag,required Map yourData})async{
    //FirebaseFirestore.instance.collection('users').doc("sjflsjfAljk2820").collection("userdetails").add({'tag': 'value'});
    await FirebaseFirestore.instance.collection('users').doc(documentUID).collection("userdetails").add({"userDetails":yourData});
  }
}