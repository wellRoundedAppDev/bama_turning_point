import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/contact_us/data/models/contact_us_model.dart';
import 'package:classic_eccomerce/contact_us/presentation/cubit/contact_us_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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

    final Email email = Email(
        subject: contactUsModel.subject,
        body: contactUsModel.name +
            " - " +
            contactUsModel.mobileNumber +
            '\n' +
            contactUsModel.message,
        recipients: ["buqchashop2@gmail.com"],
        isHTML: false);

    await FlutterEmailSender.send(email);
  }
}
