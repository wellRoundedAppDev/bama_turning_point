import 'package:classic_eccomerce/app_settings/app_currencies.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../blogs/presentation/screens/blogs_screen.dart';
import '../../../contact_us/presentation/screens/contact_us_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.APP_MAIN_COLOR,
      child: Column(
        children: [
          Column(
            children: [
             const SizedBox(
                height: 24,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //         const HomeScreen()
              //     ));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(24.0),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           IconPaths.HOME_NAV_ICON,
              //           width: 30,
              //           height: 30,
              //         ),
              //         const SizedBox(
              //           width: 24,
              //         ),
              //         const Text(
              //           "Home",
              //           style: TextStyle(
              //               fontSize: FontSizes.FONT_SIZE_18,
              //               color: Colors.white),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //      CategoriesScreen()
              //     ));
              //
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(24.0),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           IconPaths.CATEGORIES_MENU_ICON,
              //           width: 30,
              //           height: 30,
              //         ),
              //         const SizedBox(
              //           width: 24,
              //         ),
              //         const Text(
              //           "Categories",
              //           style: TextStyle(
              //               fontSize: FontSizes.FONT_SIZE_18,
              //               color: Colors.white),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const BlogScreen()));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(24.0),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           IconPaths.BLOG_ICON,
              //           width: 30,
              //           height: 30,
              //         ),
              //         const SizedBox(
              //           width: 24,
              //         ),
              //         const Text(
              //           "Blog",
              //           style: TextStyle(
              //               fontSize: FontSizes.FONT_SIZE_18,
              //               color: Colors.white),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context)
              //     => const ContactsScreen()
              //     ));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(24.0),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           IconPaths.CONTACT_US_ICON,
              //           width: 30,
              //           height: 30,
              //         ),
              //         const SizedBox(
              //           width: 24,
              //         ),
              //         const Text(
              //           "Contact Us",
              //           style: TextStyle(
              //               fontSize: FontSizes.FONT_SIZE_18,
              //               color: Colors.white),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  // AuthCubit.get(context).logOut(CartCubit.get(context)).then((value) {
                  //   Navigator.pop(context);
                  // });
                  HomeCubit homeCubit = HomeCubit.get(context);
                  LocaleCubit localeCubit = LocaleCubit.get(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Center(
                              child: Text(
                                // AppLocalizations.of(context)!.the_language,
                                "Language",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.FONT_SIZE_22),
                              )),
                          content: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .setLocale(const Locale("ar"));
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .saveLocaleInSharedPrefs("ar");

                                    localeCubit.setLocale(const Locale('ar'));
                                    homeCubit.init();
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "العربية",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: FontSizes.FONT_SIZE_18),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                InkWell(
                                  onTap: () async {
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .setLocale(const Locale("en"));
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .saveLocaleInSharedPrefs("en");
                                    localeCubit.setLocale(const Locale('en'));
                                    homeCubit.init();
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "English",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: FontSizes.FONT_SIZE_18),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.language,size: 30,color: Colors.white,),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "Language",
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
                  HomeCubit homeCubit = HomeCubit.get(context);
                  AppSettingsCubit appSettingsCubit = AppSettingsCubit.get(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Center(
                              child: Text(
                                // AppLocalizations.of(context)!.the_language,
                                "Currency",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.FONT_SIZE_22),
                              )),
                          content: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .setLocale(const Locale("ar"));
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .saveLocaleInSharedPrefs("ar");

                                    appSettingsCubit.changeCurrency(CurrencyCodes.IQD.name);
                                    homeCubit.init();
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Iraqi Dinar",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: FontSizes.FONT_SIZE_18),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                InkWell(
                                  onTap: () async {
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .setLocale(const Locale("en"));
                                    // context
                                    //     .read<LocaleProvider>()
                                    //     .saveLocaleInSharedPrefs("en");
                                    appSettingsCubit.changeCurrency(CurrencyCodes.USD.name);
                                    homeCubit.init();
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "American Dollar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: FontSizes.FONT_SIZE_18),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.currency_exchange_outlined,size: 30,color: Colors.white,),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "Currency",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_18,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),

              (AuthCubit.get(context).isUserLoggedIn == false)
                  ?Container():
              InkWell(
                onTap: () {
                  AuthCubit.get(context).logOut(CartCubit.get(context)).then((value) {
                    Navigator.pop(context);
                  });
                },
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2,vertical: 8),
            child: Image.asset(ImagePaths.APP_LOGO_2),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
