import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @the_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get the_language;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @you_must_login_to_delete_product_to_wish_list.
  ///
  /// In en, this message translates to:
  /// **'You must login to delete product to wish list'**
  String get you_must_login_to_delete_product_to_wish_list;

  /// No description provided for @you_must_login_to_add_product_to_wish_list.
  ///
  /// In en, this message translates to:
  /// **'You must login to add product to wish list'**
  String get you_must_login_to_add_product_to_wish_list;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @american_dollar.
  ///
  /// In en, this message translates to:
  /// **'American Dollar'**
  String get american_dollar;

  /// No description provided for @iraqi_dinar.
  ///
  /// In en, this message translates to:
  /// **'Iraqi Dinar'**
  String get iraqi_dinar;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @shop_by_categories.
  ///
  /// In en, this message translates to:
  /// **'Shop by category'**
  String get shop_by_categories;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get view_all;

  /// No description provided for @featured_products.
  ///
  /// In en, this message translates to:
  /// **'Featured Products'**
  String get featured_products;

  /// No description provided for @new_arrivals.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get new_arrivals;

  /// No description provided for @best_sellers.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get best_sellers;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @request_holiday.
  ///
  /// In en, this message translates to:
  /// **'Request Holiday'**
  String get request_holiday;

  /// No description provided for @holiday_type.
  ///
  /// In en, this message translates to:
  /// **'Holiday Type'**
  String get holiday_type;

  /// No description provided for @from_date.
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get from_date;

  /// No description provided for @to_date.
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get to_date;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @enter_reason_here.
  ///
  /// In en, this message translates to:
  /// **'Enter the reason here'**
  String get enter_reason_here;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get select_date;

  /// No description provided for @select_holiday_type.
  ///
  /// In en, this message translates to:
  /// **'Select holiday type'**
  String get select_holiday_type;

  /// No description provided for @installments_count.
  ///
  /// In en, this message translates to:
  /// **'Number of Installments'**
  String get installments_count;

  /// No description provided for @break_time.
  ///
  /// In en, this message translates to:
  /// **'Break Time'**
  String get break_time;

  /// No description provided for @working_hours.
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get working_hours;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get log_out;

  /// No description provided for @last_month_report.
  ///
  /// In en, this message translates to:
  /// **'Last Month\'s Report'**
  String get last_month_report;

  /// No description provided for @registration_success.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get registration_success;

  /// No description provided for @login_time.
  ///
  /// In en, this message translates to:
  /// **'You logged in at'**
  String get login_time;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @search_here.
  ///
  /// In en, this message translates to:
  /// **'Search here'**
  String get search_here;

  /// No description provided for @verify_your_number.
  ///
  /// In en, this message translates to:
  /// **'Verify your phone number'**
  String get verify_your_number;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @enter_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enter_your_phone_number;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @enter_a_valid_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number'**
  String get enter_a_valid_phone_number;

  /// No description provided for @new_here.
  ///
  /// In en, this message translates to:
  /// **'NEW HERE?'**
  String get new_here;

  /// No description provided for @sign_in_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get sign_in_to_continue;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @did_you_forget_password.
  ///
  /// In en, this message translates to:
  /// **'Did you forget your password?'**
  String get did_you_forget_password;

  /// No description provided for @enter_a_password_of_at_least_six_characters.
  ///
  /// In en, this message translates to:
  /// **'Enter a password of at least 6 characters'**
  String get enter_a_password_of_at_least_six_characters;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_an_account;

  /// No description provided for @please_enable_your_gps_and_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please enable your gps and try again'**
  String get please_enable_your_gps_and_try_again;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get try_again;

  /// No description provided for @send_again.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get send_again;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get reset_password;

  /// No description provided for @create_password.
  ///
  /// In en, this message translates to:
  /// **'Create password'**
  String get create_password;

  /// No description provided for @create_password_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Create password to continue'**
  String get create_password_to_continue;

  /// No description provided for @verification_number.
  ///
  /// In en, this message translates to:
  /// **'Verification number'**
  String get verification_number;

  /// No description provided for @verification_code_will_be_sent_to_your_phone_now.
  ///
  /// In en, this message translates to:
  /// **'Verification code will be sent to your phone now'**
  String get verification_code_will_be_sent_to_your_phone_now;

  /// No description provided for @to_know_you_more.
  ///
  /// In en, this message translates to:
  /// **'To know you more!'**
  String get to_know_you_more;

  /// No description provided for @enter_your_name_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Enter your name to continue'**
  String get enter_your_name_to_continue;

  /// No description provided for @your_name.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get your_name;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name;

  /// No description provided for @family_name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get family_name;

  /// No description provided for @governorate_user.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get governorate_user;

  /// No description provided for @enter_governorate.
  ///
  /// In en, this message translates to:
  /// **'Enter your governorate'**
  String get enter_governorate;

  /// No description provided for @judiciary_user.
  ///
  /// In en, this message translates to:
  /// **'Judiciary'**
  String get judiciary_user;

  /// No description provided for @enter_judiciary.
  ///
  /// In en, this message translates to:
  /// **'Enter your judiciary'**
  String get enter_judiciary;

  /// No description provided for @way_user.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get way_user;

  /// No description provided for @way_governorate.
  ///
  /// In en, this message translates to:
  /// **'Enter your city'**
  String get way_governorate;

  /// No description provided for @name_user.
  ///
  /// In en, this message translates to:
  /// **'user name'**
  String get name_user;

  /// No description provided for @enter_name_user.
  ///
  /// In en, this message translates to:
  /// **'Enter user name'**
  String get enter_name_user;

  /// No description provided for @enter_your_first_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get enter_your_first_name;

  /// No description provided for @enter_your_family_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enter_your_family_name;

  /// No description provided for @enter_your_email_to_get_updates.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to get updates'**
  String get enter_your_email_to_get_updates;

  /// No description provided for @email_optional.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get email_optional;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @email_valid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get email_valid;

  /// No description provided for @email_exist.
  ///
  /// In en, this message translates to:
  /// **'Email already exists'**
  String get email_exist;

  /// No description provided for @enter_your_main_address.
  ///
  /// In en, this message translates to:
  /// **'Enter your main address'**
  String get enter_your_main_address;

  /// No description provided for @enter_your_main_userName.
  ///
  /// In en, this message translates to:
  /// **'Enter your user name'**
  String get enter_your_main_userName;

  /// No description provided for @address_optional.
  ///
  /// In en, this message translates to:
  /// **'Address (optional)'**
  String get address_optional;

  /// No description provided for @network_connection_failed.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed'**
  String get network_connection_failed;

  /// No description provided for @street_name.
  ///
  /// In en, this message translates to:
  /// **'Street name'**
  String get street_name;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartement'**
  String get apartment;

  /// No description provided for @enter_street_name.
  ///
  /// In en, this message translates to:
  /// **'Enter street name'**
  String get enter_street_name;

  /// No description provided for @enter_area.
  ///
  /// In en, this message translates to:
  /// **'Enter area'**
  String get enter_area;

  /// No description provided for @enter_home.
  ///
  /// In en, this message translates to:
  /// **'Enter home'**
  String get enter_home;

  /// No description provided for @enter_floor.
  ///
  /// In en, this message translates to:
  /// **'Enter floor'**
  String get enter_floor;

  /// No description provided for @enter_apartment.
  ///
  /// In en, this message translates to:
  /// **'Enter apartement'**
  String get enter_apartment;

  /// No description provided for @check_your_internet_connection_and_try_again_later.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again'**
  String get check_your_internet_connection_and_try_again_later;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get add_to_cart;

  /// No description provided for @buy_now.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get buy_now;

  /// No description provided for @added_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get added_to_cart;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @enter_an_address_of_at_least_four_characters.
  ///
  /// In en, this message translates to:
  /// **'Enter an address of at least 4 characters'**
  String get enter_an_address_of_at_least_four_characters;

  /// No description provided for @enter_your_postal_code.
  ///
  /// In en, this message translates to:
  /// **'Enter your postal code'**
  String get enter_your_postal_code;

  /// No description provided for @billing_address.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get billing_address;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @postal_code.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get postal_code;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @region_or_state.
  ///
  /// In en, this message translates to:
  /// **'Region / State'**
  String get region_or_state;

  /// No description provided for @enter_your_city.
  ///
  /// In en, this message translates to:
  /// **'Enter your city'**
  String get enter_your_city;

  /// No description provided for @select_your_country.
  ///
  /// In en, this message translates to:
  /// **'Select your country'**
  String get select_your_country;

  /// No description provided for @select_your_region_or_state.
  ///
  /// In en, this message translates to:
  /// **'Select your Region / State'**
  String get select_your_region_or_state;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get add_address;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @enter_full_name.
  ///
  /// In en, this message translates to:
  /// **'Enter full name'**
  String get enter_full_name;

  /// No description provided for @selected_address.
  ///
  /// In en, this message translates to:
  /// **'Selected Address'**
  String get selected_address;

  /// No description provided for @select_address.
  ///
  /// In en, this message translates to:
  /// **'Select address'**
  String get select_address;

  /// No description provided for @shipping_method.
  ///
  /// In en, this message translates to:
  /// **'Shipping Method'**
  String get shipping_method;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @coupon.
  ///
  /// In en, this message translates to:
  /// **'Coupon'**
  String get coupon;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @enter_your_coupon_here.
  ///
  /// In en, this message translates to:
  /// **'Enter your coupon here'**
  String get enter_your_coupon_here;

  /// No description provided for @shopping_cart.
  ///
  /// In en, this message translates to:
  /// **'Shopping Cart'**
  String get shopping_cart;

  /// No description provided for @confirm_order.
  ///
  /// In en, this message translates to:
  /// **'Confirm order'**
  String get confirm_order;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @your_order_has_been_successfully_processed.
  ///
  /// In en, this message translates to:
  /// **'Your order has been successfully processed'**
  String get your_order_has_been_successfully_processed;

  /// No description provided for @your_complain_has_been_successfully_processed.
  ///
  /// In en, this message translates to:
  /// **'Your complain has been successfully processed'**
  String get your_complain_has_been_successfully_processed;

  /// No description provided for @thanks_for_shopping_with_us_online.
  ///
  /// In en, this message translates to:
  /// **'Thanks for shopping with us online'**
  String get thanks_for_shopping_with_us_online;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get my_account;

  /// No description provided for @edit_your_account_info.
  ///
  /// In en, this message translates to:
  /// **'Edit your account information'**
  String get edit_your_account_info;

  /// No description provided for @modify_your_address_book_entries.
  ///
  /// In en, this message translates to:
  /// **'Modify your address book entries'**
  String get modify_your_address_book_entries;

  /// No description provided for @change_your_password.
  ///
  /// In en, this message translates to:
  /// **'Change your password'**
  String get change_your_password;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @passwords_dont_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwords_dont_match;

  /// No description provided for @orders_history.
  ///
  /// In en, this message translates to:
  /// **'Orders history'**
  String get orders_history;

  /// No description provided for @no_orders_history.
  ///
  /// In en, this message translates to:
  /// **'No orders history'**
  String get no_orders_history;

  /// No description provided for @add_order.
  ///
  /// In en, this message translates to:
  /// **'Add orders'**
  String get add_order;

  /// No description provided for @checkGovernorate.
  ///
  /// In en, this message translates to:
  /// **'Check you select Governorate'**
  String get checkGovernorate;

  /// No description provided for @checkJudiciary.
  ///
  /// In en, this message translates to:
  /// **'Check you select Judiciary'**
  String get checkJudiciary;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get my_orders;

  /// No description provided for @view_your_orders_history.
  ///
  /// In en, this message translates to:
  /// **'View your orders history'**
  String get view_your_orders_history;

  /// No description provided for @address_book_entries.
  ///
  /// In en, this message translates to:
  /// **'Address book entries'**
  String get address_book_entries;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit_address.
  ///
  /// In en, this message translates to:
  /// **'Edit address'**
  String get edit_address;

  /// No description provided for @default_address.
  ///
  /// In en, this message translates to:
  /// **'Default Address'**
  String get default_address;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @order_id.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get order_id;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @number_of_products.
  ///
  /// In en, this message translates to:
  /// **'No. of Products'**
  String get number_of_products;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @hanging.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get hanging;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @unacceptable.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get unacceptable;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get complete;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @vendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get vendor;

  /// No description provided for @vendor_will_add_products.
  ///
  /// In en, this message translates to:
  /// **'vendor will add product'**
  String get vendor_will_add_products;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @date_added.
  ///
  /// In en, this message translates to:
  /// **'Date Added'**
  String get date_added;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @departure.
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get departure;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @request_advance.
  ///
  /// In en, this message translates to:
  /// **'Request Advance'**
  String get request_advance;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// No description provided for @deductions.
  ///
  /// In en, this message translates to:
  /// **'Deductions'**
  String get deductions;

  /// No description provided for @entitlements.
  ///
  /// In en, this message translates to:
  /// **'Entitlements'**
  String get entitlements;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @net_salary.
  ///
  /// In en, this message translates to:
  /// **'Net Salary'**
  String get net_salary;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @order_details.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get order_details;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping address'**
  String get shipping_address;

  /// No description provided for @are_you_sure_you_want_to_logout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get are_you_sure_you_want_to_logout;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @no_notifications_found.
  ///
  /// In en, this message translates to:
  /// **'No notifications found'**
  String get no_notifications_found;

  /// No description provided for @cancel_order.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get cancel_order;

  /// No description provided for @error_occurred_try_again.
  ///
  /// In en, this message translates to:
  /// **'Error occurred, try again'**
  String get error_occurred_try_again;

  /// No description provided for @are_you_sure_you_want_to_cancel_order.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the order?'**
  String get are_you_sure_you_want_to_cancel_order;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contact_us;

  /// No description provided for @topic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get topic;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enter_your_name;

  /// No description provided for @enter_your_subject.
  ///
  /// In en, this message translates to:
  /// **'Enter topic'**
  String get enter_your_subject;

  /// No description provided for @enter_your_message.
  ///
  /// In en, this message translates to:
  /// **'Enter message'**
  String get enter_your_message;

  /// No description provided for @return_to_home_page.
  ///
  /// In en, this message translates to:
  /// **'Return to home page'**
  String get return_to_home_page;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @call_us.
  ///
  /// In en, this message translates to:
  /// **'Call us'**
  String get call_us;

  /// No description provided for @select_from_the_available_options.
  ///
  /// In en, this message translates to:
  /// **'Select from the available options'**
  String get select_from_the_available_options;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @fill_all_fields.
  ///
  /// In en, this message translates to:
  /// **'Fill all fields'**
  String get fill_all_fields;

  /// No description provided for @add_a_product.
  ///
  /// In en, this message translates to:
  /// **'Add a product'**
  String get add_a_product;

  /// No description provided for @enter_product_name.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get enter_product_name;

  /// No description provided for @enter_product_price.
  ///
  /// In en, this message translates to:
  /// **'Enter product price'**
  String get enter_product_price;

  /// No description provided for @select_category.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get select_category;

  /// No description provided for @iraq.
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get iraq;

  /// No description provided for @seller_pending_approval.
  ///
  /// In en, this message translates to:
  /// **'Seller pending approval'**
  String get seller_pending_approval;

  /// No description provided for @product_pending_approval.
  ///
  /// In en, this message translates to:
  /// **'Product pending approval'**
  String get product_pending_approval;

  /// No description provided for @vendor_products.
  ///
  /// In en, this message translates to:
  /// **'Vendor products'**
  String get vendor_products;

  /// No description provided for @iraqi_dinar_initials.
  ///
  /// In en, this message translates to:
  /// **'IQD'**
  String get iraqi_dinar_initials;

  /// No description provided for @enter_as_vendor.
  ///
  /// In en, this message translates to:
  /// **'Enter as vendor'**
  String get enter_as_vendor;

  /// No description provided for @upload_image.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get upload_image;

  /// No description provided for @used.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get used;

  /// No description provided for @enter_motorcycle_name.
  ///
  /// In en, this message translates to:
  /// **'Enter motorcycle name'**
  String get enter_motorcycle_name;

  /// No description provided for @enter_motorcycle_price.
  ///
  /// In en, this message translates to:
  /// **'Enter motorcycle price'**
  String get enter_motorcycle_price;

  /// No description provided for @odometer.
  ///
  /// In en, this message translates to:
  /// **'Odometer'**
  String get odometer;

  /// No description provided for @odometer_in_km.
  ///
  /// In en, this message translates to:
  /// **'Odometer in Km'**
  String get odometer_in_km;

  /// No description provided for @enter_odometer.
  ///
  /// In en, this message translates to:
  /// **'Enter odometer'**
  String get enter_odometer;

  /// No description provided for @enter_odometer_in_km.
  ///
  /// In en, this message translates to:
  /// **'Enter odometer in Km'**
  String get enter_odometer_in_km;

  /// No description provided for @new_motorcycle_client.
  ///
  /// In en, this message translates to:
  /// **'New motorcycle-client'**
  String get new_motorcycle_client;

  /// No description provided for @used_motorcycle_client.
  ///
  /// In en, this message translates to:
  /// **'Used motorcycle-client'**
  String get used_motorcycle_client;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'Kilometer'**
  String get km;

  /// No description provided for @enter_address.
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get enter_address;

  /// No description provided for @enter_description.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enter_description;

  /// No description provided for @neww.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get neww;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @enter_model.
  ///
  /// In en, this message translates to:
  /// **'Enter model'**
  String get enter_model;

  /// No description provided for @motorcycle_name.
  ///
  /// In en, this message translates to:
  /// **'Bike name'**
  String get motorcycle_name;

  /// No description provided for @motorcycle_price.
  ///
  /// In en, this message translates to:
  /// **'Bike price'**
  String get motorcycle_price;

  /// No description provided for @please_add_images_to_product.
  ///
  /// In en, this message translates to:
  /// **'Please add images to product'**
  String get please_add_images_to_product;

  /// No description provided for @dinar.
  ///
  /// In en, this message translates to:
  /// **'Dinar'**
  String get dinar;

  /// No description provided for @dollar.
  ///
  /// In en, this message translates to:
  /// **'Dollar'**
  String get dollar;

  /// No description provided for @phone_number_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Phone number already exists'**
  String get phone_number_already_exists;

  /// No description provided for @wrong_phone_number_or_password.
  ///
  /// In en, this message translates to:
  /// **'Wrong user name or password'**
  String get wrong_phone_number_or_password;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groups;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @products_name.
  ///
  /// In en, this message translates to:
  /// **'name of Product'**
  String get products_name;

  /// No description provided for @complains.
  ///
  /// In en, this message translates to:
  /// **'Complains'**
  String get complains;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @message_sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully'**
  String get message_sent_successfully;

  /// No description provided for @welcome_user.
  ///
  /// In en, this message translates to:
  /// **'Welcome {username}'**
  String welcome_user(String username);

  /// No description provided for @merchants.
  ///
  /// In en, this message translates to:
  /// **'Merchants'**
  String get merchants;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @there_isnt_products.
  ///
  /// In en, this message translates to:
  /// **'There aren\'t any products available.'**
  String get there_isnt_products;

  /// No description provided for @product_added_to_favorites.
  ///
  /// In en, this message translates to:
  /// **'Product added to favorites'**
  String get product_added_to_favorites;

  /// No description provided for @add_products_to_favourite.
  ///
  /// In en, this message translates to:
  /// **'add products to favourite'**
  String get add_products_to_favourite;

  /// No description provided for @add_products_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add products to cart'**
  String get add_products_to_cart;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @product_removed_from_wish_list.
  ///
  /// In en, this message translates to:
  /// **'Product removed from wishlist'**
  String get product_removed_from_wish_list;

  /// No description provided for @attendance_and_departure.
  ///
  /// In en, this message translates to:
  /// **'Attendance and Departure'**
  String get attendance_and_departure;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'logout'**
  String get logout;

  /// No description provided for @today_attendance.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Attendance'**
  String get today_attendance;

  /// No description provided for @payroll.
  ///
  /// In en, this message translates to:
  /// **'Payroll'**
  String get payroll;

  /// No description provided for @you_are_out_of_work_range.
  ///
  /// In en, this message translates to:
  /// **'You are out of work range'**
  String get you_are_out_of_work_range;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
