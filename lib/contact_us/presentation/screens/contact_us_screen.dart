import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared_components/custom_input.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(
        title: "Contact Us",
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/map_dummy_img.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.APP_MAIN_COLOR,
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(IconPaths.PIN),
                  )),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store Address",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff313846)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Iraq - baghdad",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff596077)),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffDADCE1),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.APP_MAIN_COLOR,
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(IconPaths.CALL_US),
                  )),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Call Us",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff313846)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Tel: 1.800.555.9090\nFax: 1.800.555.9090",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff596077)),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffDADCE1),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.APP_MAIN_COLOR,
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(IconPaths.CLOCK),
                  )),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store Address",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff313846)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Mon-Fri: 10:00 - 20:00\nWeekend: 12:00 - 16:00",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff596077)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Send Message",
              style: TextStyle(
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
              color: const Color(0xff015963),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: CustomInput(
                  hintText: "Your Name",
                  borderColor: const Color(0xff95989A),
                )),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: CustomInput(
                  hintText: "Topic",
                  borderColor: const Color(0xff95989A),
                )),
            const SizedBox(
              height: 16,
            ),
            CustomInput(
              hintText: "Message",
              borderColor: const Color(0xff95989A),
              maxLines: 4,
              minLines: null,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(text: "Submit", action: () {}),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      )),
    ));
  }
}
