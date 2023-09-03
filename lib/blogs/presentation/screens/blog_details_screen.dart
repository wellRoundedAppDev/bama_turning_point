import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared_components/custom_app_bar.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "Blog"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/product_dummy.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 4),
                      color: AppColors.APP_MAIN_COLOR,
                      child: const Column(
                        children: [
                          Text(
                            "26",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text("SEP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Post Sample 1",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizes.FONT_SIZE_20,
                    color: Color(0xff313846)),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Posted by ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff878787)),
                      ),
                      Text(
                        "Admin",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            color: Color(0xff015963)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        IconPaths.CHAT_BUBBLE,
                        width: 20,
                        height: 20,
                        color: const Color(0xffD0D0D0),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "43",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(IconPaths.FAV_ICON,
                          width: 20,
                          height: 20,
                          color: const Color(0xffD0D0D0)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "300",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_12,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                color: Color(0xffDEDEDE),
                thickness: 1,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tincidunt, sapien nec tempus condimentum, lectus justo pretium nisl, id fringilla tortor massa vitae mi. Ut cursus, turpis vel gravida facilisis, sapien neque rhoncus leo, eu volutpat ipsum massa nec purus. Aliquam rhoncus blandit eros. Vivamus vitae sollicitudin tellus. Cras non leo lectus. Nunc eget elementum risus. Quisque ut elit at libero sollicitudin blandit. In tincidunt condimentum consectetur. Aenean quis sollicitudin enim. Etiam orci tortor, varius vel venenatis eu, consectetur nec tortor. Duis nec ligula tellus. Donec pharetra faucibus elementum. In at rhoncus turpis.",
                style: TextStyle(
                    color: Color(0xff596077), fontSize: FontSizes.FONT_SIZE_14),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        IconPaths.SMILEY_FACE,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "0",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff596077)),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        IconPaths.LOVE,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "0",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff596077)),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        IconPaths.WOW,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "0",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff596077)),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        IconPaths.LAUGH,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "1",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            color: Color(0xff596077)),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Leave a comment",
                style: TextStyle(
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
                    hintText: "E-Mail",
                    borderColor: const Color(0xff95989A),
                  )),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 50,
                  child: CustomInput(
                    hintText: "Web Site",
                    borderColor: const Color(0xff95989A),
                  )),
              const SizedBox(
                height: 16,
              ),
              CustomInput(
                hintText: "Comments",
                maxLines: 4,
                minLines: null,
                borderColor: const Color(0xff95989A),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  text: "Submit",
                  elevation: 0,
                  height: 50,
                  textFontSize: FontSizes.FONT_SIZE_16,
                  action: () {})
            ],
          ),
        ),
      ),
    ));
  }
}
