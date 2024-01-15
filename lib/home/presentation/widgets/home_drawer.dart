import 'package:classic_eccomerce/app_settings/app_currencies.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_states.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/cubit.dart';
import 'package:classic_eccomerce/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.APP_MAIN_COLOR,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.FONT_SIZE_22),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
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
                                  title: Center(
                                      child: Text(
                                    AppLocalizations.of(context)!.the_language,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSizes.FONT_SIZE_22),
                                  )),
                                  content: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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

                                            localeCubit
                                                .setLocale(const Locale('ar'));
                                            homeCubit.init();
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "العربية",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_18),
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
                                            localeCubit
                                                .setLocale(const Locale('en'));
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
                                                      fontSize: FontSizes
                                                          .FONT_SIZE_18),
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.the_language,
                                style: const TextStyle(
                                    fontSize: FontSizes.FONT_SIZE_18,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.language,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!.language,
                                      style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_18,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HomeCubit homeCubit = HomeCubit.get(context);
                          AppSettingsCubit appSettingsCubit =
                              AppSettingsCubit.get(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Text(
                                    AppLocalizations.of(context)!.currency,
                                    // "Currency",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSizes.FONT_SIZE_22),
                                  )),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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

                                          appSettingsCubit.changeCurrency(
                                              CurrencyCodes.IQD.name);
                                          homeCubit.init();
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${AppLocalizations.of(context)!.iraqi_dinar} (IQD)",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    FontSizes.FONT_SIZE_18),
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
                                          appSettingsCubit.changeCurrency(
                                              CurrencyCodes.USD.name);
                                          homeCubit.init();
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${AppLocalizations.of(context)!.american_dollar} (USD)",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        FontSizes.FONT_SIZE_18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.currency,
                                style: const TextStyle(
                                    fontSize: FontSizes.FONT_SIZE_18,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.currency_exchange_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  BlocConsumer<AppSettingsCubit,
                                      AppSettingsStates>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return Expanded(
                                        child: Text(
                                          (AppSettingsCubit.get(context)
                                                      .currencyCode ==
                                                  "USD")
                                              ? "${AppLocalizations.of(context)!.american_dollar} (USD)"
                                              : "${AppLocalizations.of(context)!.iraqi_dinar} (IQD)",
                                          style: const TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_18,
                                              color: Colors.white),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const ContactUsScreen(),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.contact_us,
                                style: const TextStyle(
                                    fontSize: FontSizes.FONT_SIZE_18,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      AppLocalizations.of(context)!.contact_us,
                                      style: const TextStyle(
                                          fontSize: FontSizes.FONT_SIZE_18,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      (AuthCubit.get(context).isUserLoggedIn == false)
                          ? Container()
                          : InkWell(
                              onTap: () {
                                AuthCubit.get(context)
                                    .logOut(CartCubit.get(context))
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      IconPaths.LOGOUT_ICON,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 8,
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
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2,
                vertical: 8),
            child: Image.asset(ImagePaths.APP_LOGO_2),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
