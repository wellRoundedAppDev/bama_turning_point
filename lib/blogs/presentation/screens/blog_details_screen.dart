import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/product_dummy.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.27,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 15,
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
                height: 8,
              ),
              const Text(
                "Post Sample 1",
                style: TextStyle(
                    fontSize: FontSizes.FONT_SIZE_20, color: Color(0xff313846)),
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  Text(
                    "Posted by",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_12, color: Color(0xff878787)),
                  ),
                  Text(
                    " Admin",
                    style: TextStyle(
                        fontSize: FontSizes.FONT_SIZE_12, color: Color(0xff015963)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
