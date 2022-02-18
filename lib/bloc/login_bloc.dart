import 'package:mybloclogin/models/login_model.dart';
import 'package:mybloclogin/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _loginPS = PublishSubject<LoginModel>();

  Stream<LoginModel> get login => _loginPS.stream;

  LoginBlocfun(String _email,String _password) async {
    LoginModel itemnewModel = await _repository.repoLoginFun(_email,_password);
    _loginPS.sink.add(itemnewModel);
  }

  dispose() {
    _loginPS.close();
  }
}

final _lbobj = LoginBloc();