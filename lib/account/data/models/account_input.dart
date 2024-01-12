import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        'customer_id': 1,
        'status': 1,
        "email": email,
        "telephone": MyApp.navKey.currentState?.context
            .read<AuthCubit>()
            .loginResponse
            ?.loginData
            ?.telephone,
        "custom_field": {
          "account": {"1": ""}
        },
        'mobileAppId': 1,
        'address_id': 1,
        // 'cart_count_products': 1,
        'agree': 1,
        'customer_group_id': 1,
      };
}
