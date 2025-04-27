class LoginFormInput{
  String? username;
  String? password;

  Map<String, dynamic> toJson() => {
    "userName": username,
    "password": password
  };
}