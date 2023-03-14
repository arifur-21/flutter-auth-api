class UserModel {
  String? token;
  bool? isLogin;

  UserModel({
      this.token, this.isLogin});

  UserModel.fromJson(dynamic json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['isLogin'] = isLogin;
    return map;
  }

}