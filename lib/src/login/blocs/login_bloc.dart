import 'package:bookstore/common/blocs/user_blocs.dart';
import 'package:bookstore/common/models/user_model.dart';
import 'package:bookstore/common/notification_service.dart';
import 'package:bookstore/src/login/blocs/validateFields.dart';
import 'package:rxdart/rxdart.dart';

class LoginEmailBloc with ValidatorsFields {
  //email
  final BehaviorSubject<String> _emailBlocCollection = BehaviorSubject<String>();
  String? email;

  //password
  final BehaviorSubject<String> _passwordBlocCollection = BehaviorSubject<String>();
  String? password;

  //cambiar data
  void emailChange(String newEmail) async {
    email = newEmail;
    _emailBlocCollection.sink.add(email ?? "");
  }

  void passwordChange(String newPassword) async {
    password = newPassword;
    _passwordBlocCollection.sink.add(password ?? "");
  }

  Future<bool> login() async {
    UsersLogin usersLogin = usersBloc.getUsers();
    for (var i = 0; i < usersLogin.users!.length; i++) {
      if(usersLogin.users![i].user == email && usersLogin.users![i].password == password){
        return true;
      }
    }
    showToast('error en datos de acceso', TypeSnackBar.alert);
    return false;
  }

  showToast(String? msg, TypeSnackBar typeSnackBar) {
    NotificationService.showSnackBar(msg, typeSnackBar);
  }

  //recuperar data
  Stream<String> get emailStream => _emailBlocCollection.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordBlocCollection.stream;

  void dispose() {
    _emailBlocCollection.close();
    _passwordBlocCollection.close();
  }
}
