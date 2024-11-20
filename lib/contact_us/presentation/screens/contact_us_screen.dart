import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_states.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/custom_input.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ContactUsCubit contactUsCubit = ContactUsCubit.get(context);
          return SafeArea(
              child: Scaffold(
            appBar: CustomAppBar.renderAppBar(title: "", showCartIcon: false),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: contactUsCubit.contactUsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.contact_us,
                                style: const TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                width: 40,
                                height: 3,
                                color: AppColors.APP_MAIN_COLOR,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.call_us,
                              style: const TextStyle(
                                  fontSize: FontSizes.FONT_SIZE_18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                contactUsCubit.callUs();
                              },
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.APP_MAIN_COLOR),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 24,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.your_name,
                      hintText: AppLocalizations.of(context)!.your_name,
                      validator: (name) {
                        if (name?.isEmpty == true) {
                          return AppLocalizations.of(context)!.enter_your_name;
                        }
                      },
                      onSaved: (name) =>
                          contactUsCubit.contactUsModel.name = name ?? "",
                      borderColor: const Color(0xff95989A),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.phone_number,
                      hintText: AppLocalizations.of(context)!.phone_number,
                      textInputType: TextInputType.phone,
                      validator: (phone) {
                        if (phone == null ||
                            phone.length < 8 ||
                            phone.length > 13) {
                          return AppLocalizations.of(context)!
                              .enter_a_valid_phone_number;
                        }
                      },
                      onSaved: (phone) => contactUsCubit
                          .contactUsModel.mobileNumber = phone ?? "",
                      borderColor: const Color(0xff95989A),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      label: AppLocalizations.of(context)!.topic,
                      hintText: AppLocalizations.of(context)!.topic,
                      validator: (topic) {
                        if (topic?.isEmpty == true) {
                          return AppLocalizations.of(context)!
                              .enter_your_subject;
                        }
                      },
                      onSaved: (topic) =>
                          contactUsCubit.contactUsModel.subject = topic ?? "",
                      borderColor: const Color(0xff95989A),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    CustomInput(
                      label: AppLocalizations.of(context)!.message,
                      hintText: AppLocalizations.of(context)!.message,
                      borderColor: const Color(0xff95989A),
                      validator: (message) {
                        if (message?.isEmpty == true) {
                          return AppLocalizations.of(context)!
                              .enter_your_message;
                        }
                      },
                      onSaved: (message) =>
                          contactUsCubit.contactUsModel.message = message ?? "",
                      maxLines: 4,
                      minLines: null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: AppLocalizations.of(context)!.send,
                        action: () async {
                          await contactUsCubit.sendEmail();
                        }),
                  ],
                ),
              ),
            )),
          ));
        },
      ),
    );
  }
}
