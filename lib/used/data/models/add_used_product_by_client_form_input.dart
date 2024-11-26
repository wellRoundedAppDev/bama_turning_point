import 'package:classic_eccomerce/account/data/data_sources/remote_data_sources/account_apis.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddUsedProductByClientFormInput {
  String? name;
  String? price;

  List<String>? imagePaths;
  String? phoneNumber;

  String? odometer;
  String? address;
  String? description;

  String? model;

  AddUsedProductByClientFormInput({
    this.name,
    this.price,
    this.odometer,
    this.description,
    this.address,
    this.phoneNumber,
    this.imagePaths,
    this.model,
  });

  Future<Map<String, dynamic>> toJsonForApi() async {

    var files  = [];
    for(var path in imagePaths!){
      var multiPartFile = await MultipartFile.fromFile(path);
      files .add(multiPartFile);
    }

    return {
      "Id": 0,
      "Name": name,
      "Price": price,
      "Odometer": odometer,
      "Model": model,
      "PhoneNumber": phoneNumber,
      "Address": address,
      "Description": description,
      "Username": MyApp.navKey.currentState?.context
          .read<AuthCubit>()
          ?.loginResponse
          ?.loginData
          ?.email,
      "Images": files
    };
  }
}
