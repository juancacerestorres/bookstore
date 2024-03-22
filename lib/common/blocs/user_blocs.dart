import 'dart:convert';

import 'package:bookstore/common/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc{
  UsersLogin usersLogin = UsersLogin(users: []);


  UserBloc(){
    addNewUser('test', '123');
  }

  saveUsers() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('users', jsonEncode(usersLogin.toJson()));
    loadUsers();
  }


  loadUsers() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final users = prefs.getString('users');
    usersLogin = UsersLogin.fromJson(jsonDecode(users ?? ""));
  }

  addNewUser(String user, String password){
    usersLogin.users!.add(Users(user: user, password: password));
    saveUsers();
    loadUsers();
  }

  UsersLogin getUsers(){
    return usersLogin;
  }
}

final usersBloc = UserBloc();