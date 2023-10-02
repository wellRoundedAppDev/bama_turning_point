import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/core/constants/paths/routes/routes/routes_ids.dart';
import 'package:classic_eccomerce/home_layout/presentation/screens/home_layout.dart';
import 'package:classic_eccomerce/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'cart/presentation/screens/cart_screen.dart';
import 'core/bloc_observer.dart';
import 'core/constants/colors/colors.dart';
import 'core/constants/fonts/font_families.dart';
import 'core/locales/l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  //await Firebase.initializeApp();
  //await initFirebaseFCM();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit())],
      child: MaterialApp(
        navigatorKey: navKey,
        title: 'North Grass',
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          //AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        locale: const Locale("en"),
        routes: {
          RoutesIDs.SPLASH_SCREEN_ROUTE_ID : (context) => const SplashScreen(),
          RoutesIDs.CART_SCREEN_ROUTE_ID : (context) =>  CartScreen(),
          RoutesIDs.HOME_LAYOUT_SCREEN_ROUTE_ID : (context) =>  const HomeLayoutScreen()


        },
        theme: ThemeData(

          dividerColor: Colors.transparent,
          primaryColor: AppColors.APP_MAIN_COLOR,
          fontFamily: FontFamilies.OPEN_SANS,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.APP_MAIN_COLOR,
          )),
          primarySwatch: MaterialColor(AppColors.APP_MAIN_COLOR_HEX, {
            50: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.1),
            100: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.2),
            200: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.3),
            300: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.4),
            400: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.5),
            500: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.6),
            600: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.7),
            700: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.8),
            800: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(0.9),
            900: const Color(AppColors.APP_MAIN_COLOR_HEX).withOpacity(1),
          }),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
