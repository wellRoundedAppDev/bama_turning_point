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
                    // Image.asset(
                    //   "assets/images/map_dummy_img.png",
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   fit: BoxFit.cover,
                    // ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 60,
                    //       height: 60,
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: AppColors.APP_MAIN_COLOR,
                    //       ),
                    //       child: Center(
                    //           child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Image.asset(IconPaths.PIN),
                    //       )),
                    //     ),
                    //     const SizedBox(
                    //       width: 16,
                    //     ),
                    //     const Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Store Address",
                    //             style: TextStyle(
                    //                 fontSize: FontSizes.FONT_SIZE_16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Color(0xff313846)),
                    //           ),
                    //           SizedBox(
                    //             height: 2,
                    //           ),
                    //           Text(
                    //             "Iraq - baghdad",
                    //             maxLines: 2,
                    //             overflow: TextOverflow.ellipsis,
                    //             style: TextStyle(color: Color(0xff596077)),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // const Divider(
                    //   thickness: 1,
                    //   color: Color(0xffDADCE1),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 60,
                    //       height: 60,
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: AppColors.APP_MAIN_COLOR,
                    //       ),
                    //       child: Center(
                    //           child: Padding(
                    //         padding: const EdgeInsets.all(16.0),
                    //         child: Image.asset(IconPaths.CALL_US),
                    //       )),
                    //     ),
                    //     const SizedBox(
                    //       width: 16,
                    //     ),
                    //     const Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Call Us",
                    //             style: TextStyle(
                    //                 fontSize: FontSizes.FONT_SIZE_16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Color(0xff313846)),
                    //           ),
                    //           SizedBox(
                    //             height: 2,
                    //           ),
                    //           Text(
                    //             "Tel: 1.800.555.9090\nFax: 1.800.555.9090",
                    //             maxLines: 2,
                    //             overflow: TextOverflow.ellipsis,
                    //             style: TextStyle(color: Color(0xff596077)),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // const Divider(
                    //   thickness: 1,
                    //   color: Color(0xffDADCE1),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 60,
                    //       height: 60,
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: AppColors.APP_MAIN_COLOR,
                    //       ),
                    //       child: Center(
                    //           child: Padding(
                    //         padding: const EdgeInsets.all(12.0),
                    //         child: Image.asset(IconPaths.CLOCK),
                    //       )),
                    //     ),
                    //     const SizedBox(
                    //       width: 16,
                    //     ),
                    //     const Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Store Hours",
                    //             style: TextStyle(
                    //                 fontSize: FontSizes.FONT_SIZE_16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Color(0xff313846)),
                    //           ),
                    //           SizedBox(
                    //             height: 2,
                    //           ),
                    //           Text(
                    //             "Mon-Fri: 10:00 - 20:00\nWeekend: 12:00 - 16:00",
                    //             maxLines: 2,
                    //             overflow: TextOverflow.ellipsis,
                    //             style: TextStyle(color: Color(0xff596077)),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 32,
                    // ),
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
                        if (phone == null || phone.length < 8 || phone.length > 13) {
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
