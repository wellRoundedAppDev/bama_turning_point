class LoginFormInput{
  String? username;
  String? password;

  Map<String, dynamic> toJson() => {
    "UserName": username,
    "Password": password
  };
}