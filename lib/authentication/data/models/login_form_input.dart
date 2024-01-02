class LoginFormInput{
  String? username;
  String? password;

  Map<String, dynamic> toJson() => {
    "email": username,
    "password": password
  };
}