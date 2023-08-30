import 'package:classic_eccomerce/blogs/presentation/screens/blog_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/constants/fonts/font_sizes.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: const BlogDetailsScreen(),
                type: PageTransitionType.leftToRight));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffDBD6D6), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/product_dummy.png",
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Post Sample 1",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff313846),
                          fontSize: FontSizes.FONT_SIZE_15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, con adipiscing elit. Aenean tincidunt, sapien nec tempus condimentum, lectus justo pretium nisl, id fringilla tort..",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_14,
                          color: Color(0xff596077)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
