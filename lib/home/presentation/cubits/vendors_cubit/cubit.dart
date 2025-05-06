// import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
// import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
// import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/search_apis.dart';
// import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/vendor_apis.dart';
// import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/states.dart';
// import 'package:classic_eccomerce/home/presentation/cubits/vendors_cubit/states.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../app_settings/app_language_codes.dart';
// import '../../../../main.dart';
// import '../../../../shared_components/app_snackbar.dart';
// import '../../../../vendors/data/data_sources/vendor_apis.dart';
// import '../../../data/models/get_vendors_response.dart';
// import '../../../data/models/search_response.dart';
//
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
//
// class VendorsCubit extends Cubit<VendorStates> {
//   VendorsCubit() : super(VendorsInitialState());
//
//   static VendorsCubit get(BuildContext context) => BlocProvider.of(context);
//
//   BuildContext context = MyApp.navKey.currentState!.context;
//
//   List<Vendor>? vendors;
//
//   int page = 1;
//
//   setVendors() async{
//     // AccountApis.getLanguages();
//     emit(VendorsLoadingState());
//     var response = await VendorsApis.getVendors(
//       pageNumber:page,
//       pageSize: 1000,
//     );
//     if(response?.isSuccssed == true){
//       // AccountApis.getLanguages();
//       vendors = response?.vendors??[];
//       emit(VendorsSuccessState());
//     }
//     else if(response?.isSuccssed == false){
//
//
//       showAppSnackBar(content: AppLocalizations.of(context)!.error_occurred_try_again);
//
//       emit(VendorsFailedState());
//     }
//     else{
//
//       showAppSnackBar(content: AppLocalizations.of(context)!.network_connection_failed);
//
//       emit(VendorsNetworkConnectionFailedState());
//     }
//   }
//
//
//
// }
