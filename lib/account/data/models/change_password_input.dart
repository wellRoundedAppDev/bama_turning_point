class ChangePasswordInput {
  String password;
  String confirmPassword;

  ChangePasswordInput({required this.password, required this.confirmPassword});

  Map<String, dynamic> toJson() =>
      {"password": password, "confirm": confirmPassword};
}
