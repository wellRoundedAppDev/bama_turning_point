import 'package:classic_eccomerce/account/data/data_sources/remote_data_sources/account_apis.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:classic_eccomerce/used/data/models/add_used_product_by_client_form_input.dart';
import 'package:classic_eccomerce/used/presentation/cubit/add_used_product_by_client_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/data_sources/remote_data_sources/add_used_product_api.dart';

class AddUsedProductByClientCubit extends Cubit<AddUsedProductByClientStates> {
  AddUsedProductByClientCubit() : super(AddUsedProductByClientInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;

  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();

  AddUsedProductByClientFormInput addProductInput =
      AddUsedProductByClientFormInput();

  static AddUsedProductByClientCubit get(context) => BlocProvider.of(context);

  List<XFile>? productImages = [];

  //List<WooCategory>? wooCategories = [];

  // int? selectedCategoryId;
  //
  // int? usedOrNewCategoryId = 76;
  //
  // setCategories() async {
  //   emit(GetCategoriesLoadingState());
  //
  //   var response = await CategoriesApis.getAllCategories();
  //
  //   if (response is GetProductCategoriesResponse) {
  //     wooCategories = response.wooCategories;
  //     emit(GetCategoriesSuccessState());
  //   } else if (response is WooCommerceException) {
  //     wooCategories = null;
  //     emit(GetCategoriesFailedState());
  //   } else {
  //     wooCategories = null;
  //     emit(GetCategoriesNetworkConnectionFailedState());
  //   }
  // }

  // Future<List<WooCategory>> getCategories() async {
  //   emit(GetCategoriesLoadingState());
  //
  //   var response = await CategoriesApis.getAllCategories();
  //
  //   if (response is GetProductCategoriesResponse) {
  //     // wooCategories = response.wooCategories;
  //     return response?.wooCategories?.where((category) {
  //           return category.id?.toInt() != 77 &&
  //               category.id?.toInt() != 76 &&
  //               category.id?.toInt() != 78 &&
  //               category.id?.toInt() != 79 &&
  //               category.id?.toInt() != 15;
  //         }).toList() ??
  //         [];
  //     emit(GetCategoriesSuccessState());
  //   } else if (response is WooCommerceException) {
  //     //wooCategories = null;
  //
  //     showAppSnackBar(content: response?.message ?? "");
  //     emit(GetCategoriesFailedState());
  //
  //     return [];
  //   } else {
  //     //wooCategories = null;
  //
  //     showAppSnackBar(
  //         content: AppLocalizations.of(context)!.network_connection_failed);
  //
  //     emit(GetCategoriesNetworkConnectionFailedState());
  //
  //     return [];
  //   }
  // }
  //
  // setSelectedCategoryId(int id) {
  //   selectedCategoryId = id;
  //   emit(SetSelectedCategoryState());
  // }
  //
  // setNewOrUsedCategoryId(int id) {
  //   usedOrNewCategoryId = id;
  //   addProductInput.isUsed = id == 76 ? true : false;
  //   emit(SetSelectedCategoryState());
  // }

  // Future<dynamic> uploadImageToCloudinary(var productImage) async {
  //   var response = await AccountApis.uploadProductImageByCloudinary(
  //       await MultipartFile.fromFile(productImage?.path ?? ""));
  //   if (response is UploadImageCloudinaryResponse) {
  //     return response.url ?? "";
  //   } else if (response is CloudinaryErrorResponse) {
  //     return false;
  //   } else {
  //     return false;
  //   }
  // }

  addProduct() async {
    if (addProductFormKey.currentState?.validate() != true) {
      showAppSnackBar(content: AppLocalizations.of(context)!.fill_all_fields);
      return;
    }

    if(productImages == null || productImages?.isEmpty == true){

      showAppSnackBar(content: AppLocalizations.of(context)!.please_add_images_to_product);

      return;
    }

    addProductFormKey.currentState?.save();

    // addProductInput.categories = [];
    // addProductInput.categories?.add(WooCategory(
    //   id: selectedCategoryId,
    // ));

    // if (kDebugMode) {
    //   print(addProductInput.toJsonForApi());
    // }

    emit(AddUsedProductByClientLoadingState());
    // addProductInput.imageUrls = [];
    // for (var productImage in productImages ?? []) {
    //   if (productImage != null) {
    //     var response = await uploadImageToCloudinary(productImage);
    //
    //     if (response is String) {
    //       addProductInput.imageUrls?.add(response);
    //
    //       print("url:${response}");
    //     }
    //   }
    // }
    //

    addProductInput?.imagePaths = [];

    productImages?.forEach((p) {
      addProductInput?.imagePaths?.add(p.path);
    });
    var response = await AddUsedProductApis.addUsedProduct(
        await addProductInput.toJsonForApi());

    if (response?.status == true) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.product_pending_approval);

      Navigator.pop(context);
      emit(AddUsedProductByClientSuccessState());
    } else if (response?.status == false) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.error_occurred_try_again);

      emit(AddUsedProductByClientFailedState());
    } else {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.network_connection_failed);

      emit(AddUsedProductByClientNetworkConnectionFailedState());
    }
    // if (response is AddProductResponse) {
    //   showAppSnackBar(
    //       content: AppLocalizations.of(context)!.product_pending_approval);
    //
    //   Navigator.pop(context);
    //   emit(AddProductSuccessState());
    // } else if (response is WooCommerceException) {
    //   showAppSnackBar(content: response.message ?? "");
    //   emit(AddProductFailedState());
    // } else {
    //   showAppSnackBar(
    //       content: AppLocalizations.of(context)!.network_connection_failed);
    //   emit(AddProductNetworkConnectionFailedState());
    // }
  }

  XFile? productImage;

  pickImageDialog(BuildContext context) {
    if (productImage != null) {
      return;
    }
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      uploadImage(fromGallery: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.image,
                        size: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      uploadImage(fromGallery: false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.camera_alt,
                        size: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                  ),
                )
              ],
            ));
  }

  uploadImage({bool fromGallery = true}) async {
    if (fromGallery) {
      try {
        final tempImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (tempImage == null) {
          emit(PickImageState());
          return;
        }
        productImage = tempImage;
        emit(PickImageState());
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      try {
        final tempImage =
            await ImagePicker().pickImage(source: ImageSource.camera);
        if (tempImage == null) {
          emit(PickImageState());
          return;
        }
        productImage = tempImage;
        emit(PickImageState());
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  removeImage() {
    productImage = null;
    emit(RemoveImageState());
  }

  addProductImages({bool isFromCamera = false}) async {
    try {
      ImageSource imageSource;
      if (isFromCamera) {
        imageSource = ImageSource.camera;
      } else {
        imageSource = ImageSource.gallery;
      }

      final tempImage = await ImagePicker().pickImage(source: imageSource);
      if (tempImage == null) {
        return;
      }

      // formImage = File(tempImage.path);
      productImages?.add(tempImage);
      emit(PickImageState());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  removeProductImage({XFile? file}) {
    productImages?.remove(file);

    emit(RemoveImageState());
  }
}
