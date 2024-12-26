import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/contact_us/data/models/contact_us_model.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart' as smtp;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/app_snackbar.dart';
import '../../../shared_components/custom_alert2.dart';
import '../../data/data_sources/remote_data_sources/contact_us_api.dart';


class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit() : super(ContactUsInitialState());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> contactUsFormKey = GlobalKey<FormState>();
  ContactUsModel contactUsModel = ContactUsModel(
    name: '',
    mobileNumber: '',
    subject: '',
    message: '',
  );

  sendEmail() async {
    if (contactUsFormKey.currentState!.validate() == false) {
      return;
    }

    contactUsFormKey.currentState?.save();
    // final smtpServer = smtp.gmail('knowmore19965@gmail.com', 'knowmorea7aba7a');
    //
    // // Create the message
    // final message = Message()
    //   ..from = const Address('knowmore19965@gmail.com', 'noor')
    //   ..recipients.add('wellroundedappdev@gmail.com') // Recipient email
    //   ..subject = 'Test Email from Flutter App'
    //   ..text = 'This is a plain text email sent from a Flutter app.'
    //   ..html = '<h1>This is a Flutter Email</h1><p>Sent via SMTP.</p>';
    //
    // try {
    //   final sendReport = await send(message, smtpServer);
    //   print('Email sent: ${sendReport.toString()}');
    // } on MailerException catch (e) {
    //   print('Email not sent: ${e.toString()}');
    // }    // final Email email = Email(
    // //     subject: contactUsModel.subject,
    // //     body: contactUsModel.name +
    // //         " - " +
    // //         contactUsModel.mobileNumber +
    // //         '\n' +
    // //         contactUsModel.message,
    // //     recipients: ["buqchashop2@gmail.com"],
    // //     isHTML: false);
    // //
    await FlutterEmailSender.send(Email(subject: contactUsModel.subject,
    body: "Hello, I am ${contactUsModel.name}, phone number ${contactUsModel?.mobileNumber}\n${contactUsModel?.message}",
    recipients: [
      "buqchashop2@gmail.com"
    ]
    ));
  }


  sendToAdmin() async {
    if (contactUsFormKey?.currentState?.validate() != true) {
      return;
    }
    contactUsFormKey?.currentState?.save();

    emit(ContactUsLoadingState());
    var response = await ContactUsApi.contactUs(
        contactUsModel.name,
        contactUsModel.mobileNumber,
        contactUsModel.message,
        contactUsModel.subject);

    if (response == true) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.message_sent_successfully);

      Navigator.pop(context);
      emit(ContactUsSuccessState());
    } else {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.error_occurred_try_again);
      emit(ContactUsFailedState());
    }
  }



  callUs() async {
    String mobileNo = "07755611655";

    final Uri launchUri = Uri(
      scheme: 'tel',
      path: mobileNo,
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }
}
