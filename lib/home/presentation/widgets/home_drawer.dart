import 'package:classic_eccomerce/categories/presentation/screens/categories_screen.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../blogs/presentation/screens/blogs_screen.dart';
import '../../../contact_us/presentation/screens/contact_us_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff015963),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      const HomeScreen()
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.HOME_NAV_ICON,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const CategoriesScreen()
                  ));

                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.CATEGORIES_MENU_ICON,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BlogScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.BLOG_ICON,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Blog",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => const ContactsScreen()
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.CONTACT_US_ICON,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Contact Us",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.LOGOUT_ICON,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                ImagePaths.LEAF,
                width: 150,
                height: 150,
              )),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
