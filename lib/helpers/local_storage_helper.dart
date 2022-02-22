import 'package:localstorage/localstorage.dart';
import 'package:mybloclogin/helpers/toast.dart';

class LocalStoreageHelper{
  final LocalStorage _objS = new LocalStorage('localstorage_app');
  void addItemsToLocalStorage(String tag , String value) {
    _objS.setItem(tag, value);
  }
  String? getitemFromLocalStorage(String tag) {
    final rvalue = _objS.getItem(tag);
    return (rvalue);
  }
  void deleteitemFormLocalStorage(String tag){
    _objS.deleteItem(tag);
  }
  void clearAllData(){
    _objS.clear();
    ToastPrinter("Cleared DATA");
  }
}