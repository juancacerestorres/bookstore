class UsersLogin {
  final List<Users>? users;

  UsersLogin({
    this.users,
  });

  UsersLogin.fromJson(Map<String, dynamic> json)
      : users = (json['users'] as List?)?.map((dynamic e) => Users.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'users': users?.map((e) => e.toJson()).toList()};
}

class Users {
  final String? user;
  final String? password;

  Users({
    this.user,
    this.password,
  });

  Users.fromJson(Map<String, dynamic> json)
      : user = json['user'] as String?,
        password = json['password'] as String?;

  Map<String, dynamic> toJson() => {'user': user, 'password': password};
}
