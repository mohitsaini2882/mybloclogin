import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../models/signup_model.dart';

class SignUpBloc {
  final _repository = Repository();
  final _signupPS = PublishSubject<SignupModel>();

  Stream<SignupModel> get createaccount => _signupPS.stream;

  SignUpBlocfun(String _email,String _password) async {
    SignupModel itemModel = await _repository.repoSignupFun(_email,_password);
    _signupPS.sink.add(itemModel);
  }

  dispose() {
    _signupPS.close();
  }
}

final subloc = SignUpBloc();