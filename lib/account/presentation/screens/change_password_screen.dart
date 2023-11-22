import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/cubit.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/custom_app_bar.dart';
import '../../../shared_components/custom_button.dart';
import '../../../shared_components/custom_input.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          CustomAppBar.renderAppBar(title: "My Account", showCartIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Form(
            key: AccountCubit.get(context).changePasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Change your password",
                  style: TextStyle(
                      color: Color(0xff313846),
                      fontSize: FontSizes.FONT_SIZE_20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 40,
                  height: 3,
                  color: AppColors.APP_MAIN_COLOR,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Password",
                  validator: (v) {
                    if (v == null || v.length < 6) {
                      return "Enter a password of at least 6 characters";
                    }
                    if(v != AccountCubit.get(context).changePasswordInput.confirmPassword){
                      return "Passwords don't match!";
                    }

                  },
                  onSaved: (v) => AccountCubit.get(context).changePasswordInput.password = v!,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  hintText: "Confirm Password",
                  validator: (v) {
                    if (v == null || v.length < 6) {
                      return "Enter a password of at least 6 characters";
                    }
                    if(v != AccountCubit.get(context).changePasswordInput.password){
                      return "Passwords don't match!";
                    }
                  },
                  onSaved: (v) => AccountCubit.get(context).changePasswordInput.confirmPassword = v!,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<AccountCubit,AccountStates>(
                  listener: (context,state){},
                  builder: (context,state){
                    return CustomButton(
                        isLoading: state is ChangeAccountPasswordLoadingState,
                        text: "Save", action: () {
                      AccountCubit.get(context).changeAccountPassword();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
