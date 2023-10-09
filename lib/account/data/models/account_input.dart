class AccountInput {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  AccountInput(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  Map<String, dynamic> toJson() => {
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "telephone": phoneNumber,
        "custom_field": {
          "account": {"1": ""}
        }
      };
}
