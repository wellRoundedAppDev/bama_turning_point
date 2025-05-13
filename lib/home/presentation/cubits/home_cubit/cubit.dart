import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/data/models/get_products_in_category_response.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/banners_apis.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_brands_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/vendor_apis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_products_in_brand_response.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/screens/view_all_products_screen.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../account/data/data_sources/remote_data_sources/account_apis.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../categories/data/models/get_categories_paginated_response.dart';
import '../../../../categories/data/models/get_categories_response.dart';
import '../../../../contact_us/data/data_sources/remote_data_sources/contact_us_api.dart';
import '../../../../vendors/data/data_sources/vendor_apis.dart';
import '../../../data/models/get_banners_response.dart';
import '../../../data/models/get_brands_response.dart';
import '../../../data/models/get_vendors_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;
  LocaleCubit? localeCubit;
  AppSettingsCubit? appSettingsCubit;

  //data
  // List<BannerAd>? banners;
  List<BannerAd> banners = [];

  List<Category2>? categoriesOverview;

  // List<Category>? categoriesOverview;
  List<Category>? allCategories;
  List<Product>? allProducts;

  List<Product>? productsOverview;

  //todo check
  // List<Products>? allProducts;

  // List<ProductInCategory>? allProducts;
  // List<FeaturedProduct>? featuredProductsOverview;
  // List<FeaturedProduct>? allFeaturedProducts;
  List<LatestProduct>? newArrivalsProductsOverview;
  //List<LatestProduct>? allNewArrivals;
  // List<ProductInCategory>? bestSellersProductsOverview;
  // List<ProductInCategory>? featuredProductsOverview;
  // List<ProductInCategory>? bestSellersProductsOverview;
  // List<ProductInCategory>? featuredProductsOverview;

  List<Brand>? brands;
  List<ProductsInBrand>? productsInBrand;

  List<Vendor>? vendors;

  int allProductsPageNumber = 1;

  int allProductsPageSize = 10;

  //List<BestSeller>? allBestSellersProducts;

  // setBanners() async {
  //   var response = await GetSlideShowsApi.getSlideShows();
  //   if (response?.success == 1) {
  //     banners = response?.slideShows?[0].bannerAds;
  //   } else if (response?.success == 0) {
  //     banners = null;
  //   } else {
  //     banners = null;
  //   }
  // }

  Brand? selectedBrand;
  setSelectedBrand(Brand? brand) {
    selectedBrand = brand;
  }

  navigateToViewAllProductsScreen(
    String productsListTitle,
    CartCubit cartCubit, {
    bool isBrands = false,
  }) {
    if (isBrands == true) {
      loadViewAllProductsScreen(productsListTitle, isBrands: isBrands);
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: this,
                  child: BlocProvider.value(
                    value: cartCubit,
                    child: ViewAllProductsScreen(
                      productTitle: productsListTitle,
                      isBrands: true,
                    ),
                  )),
              type: PageTransitionType.leftToRight));
      return;
    }

    // if (productsListTitle == "Featured Products") {
    //   loadViewAllProductsScreen(productsListTitle);
    //   Navigator.push(
    //       context,
    //       PageTransition(
    //           child: BlocProvider.value(
    //               value: this,
    //               child: BlocProvider.value(
    //                 value: cartCubit,
    //                 child: ViewAllProductsScreen(
    //                   productTitle: productsListTitle,
    //                 ),
    //               )),
    //           type: PageTransitionType.leftToRight));
    // }
    // else if (productsListTitle == "New Arrivals") {
    //   loadViewAllProductsScreen(productsListTitle);
    //   Navigator.push(
    //       context,
    //       PageTransition(
    //           child: BlocProvider.value(
    //               value: this,
    //               child: BlocProvider.value(
    //                 value: cartCubit,
    //                 child: ViewAllProductsScreen(
    //                   productTitle: productsListTitle,
    //                 ),
    //               )),
    //           type: PageTransitionType.leftToRight));
    // }
    else {
      loadViewAllProductsScreen(productsListTitle);
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: this,
                  child: BlocProvider.value(
                    value: cartCubit,
                    child: ViewAllProductsScreen(
                      productTitle: productsListTitle,
                    ),
                  )),
              type: PageTransitionType.leftToRight));
    }
  }

  loadViewAllProductsScreen(
    String productsListTitle, {
    bool isBrands = false,
  }) {
    if (isBrands == true) {
      // setAllProductsInBrand();
      return;
    }

    if (productsListTitle == AppLocalizations.of(context)!.featured_products) {
      // setAllFeaturedProducts();
    } else if (productsListTitle ==
        AppLocalizations.of(context)!.new_arrivals) {
      setAllNewArrivalsProducts();
    } else {
      setAllProducts();
    }
  }

  // setFeaturedProductsOverview() async {
  //   var response = await ProductsApis.getFeaturedProductsOverview(
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.success == 1) {
  //     featuredProductsOverview = response?.data?[0].products;
  //   } else if (response?.success == 0) {
  //     featuredProductsOverview = null;
  //   } else {
  //     featuredProductsOverview = null;
  //   }
  // }

  setProductsOverview() async {
    var response =
        await ProductsApis.getAllProducts(pageNumber: 1, pageSize: 10);
    if (response?.isSuccssed == true) {
      productsOverview = response?.obj?.products
              ?.map((e) => Product(
                    productId: e.id,
                    name: e.productName,
                    price: e.minorUnitPrice,
        productImagePath: e.file?.fileUrl??"",
        productSource: e?.source?.toInt()
                  ))
              ?.toList() ??
          [];
    } else if (response?.isSuccssed == false) {
    } else {}
  }

  // setFeaturedProductsOverview() async {
  //   var response = await CategoriesApis.getProductsInCategoryById(236,
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.isSuccssed == true) {
  //     featuredProductsOverview = response!.obj!.products;
  //     // featuredProductsOverview =
  //     // featuredProductsOverview?.where((e) => e.stockStatusId != 5)?.toList();
  //
  //   } else if (response?.isSuccssed == false) {
  //     featuredProductsOverview = null;
  //   } else {
  //     featuredProductsOverview = null;
  //   }
  // }

  setNewArrivalsOverview() async {
    var response = await ProductsApis.getNewArrivalsProductsOverview(
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      newArrivalsProductsOverview = response?.latestProducts;
      newArrivalsProductsOverview = newArrivalsProductsOverview
          ?.where((e) => e.stockStatusId != 5)
          ?.toList();
    } else if (response?.success == 0) {
      newArrivalsProductsOverview = null;
    } else {
      newArrivalsProductsOverview = null;
    }
  }

  // setBestSellersOverview() async {
  //   var response = await CategoriesApis.getProductsInCategoryById(234,
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.isSuccssed == true) {
  //     bestSellersProductsOverview = response!.obj!.products;
  //     // bestSellersProductsOverview = bestSellersProductsOverview?.where((e) => e.stockStatusId != 5)?.toList();
  //
  //   } else if (response?.isSuccssed == false) {
  //     bestSellersProductsOverview = null;
  //   } else {
  //     bestSellersProductsOverview = null;
  //   }
  // }

  setCategoriesOverview() async {
    var response = await CategoriesApis.getCategoriesPaginated();

    if (response?.isSuccssed == true) {
      categoriesOverview = response?.obj;
    } else if (response?.isSuccssed == false) {
      // categoriesOverview = null;
    } else {
      // categoriesOverview = null;
    }
  }

  // setAllFeaturedProducts() async {
  //   emit(FetchingAllProductsLoadingState());
  //   var response = await ProductsApis.getFeaturedProducts(
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.success == 1) {
  //     allProducts = response?.data?[0].products;
  //     emit(FetchingAllProductsSuccessState());
  //   } else if (response?.success == 0) {
  //     allProducts = null;
  //     emit(FetchingAllProductsFailedState());
  //   } else {
  //     allProducts = null;
  //     emit(FetchingAllProductsNetworkConnectionFailedState());
  //   }
  // }
  //
  ScrollController allProductsScrollController = ScrollController();
  setAllProducts() async {
    allProductsPageNumber = 1;
    allProductsScrollController.removeListener(() {});
    allProductsScrollController.addListener(() async {
      if (allProductsScrollController.position.maxScrollExtent ==
          allProductsScrollController.offset) {
        if (state is FetchingAllProductsMoreLoadingState) {
          return;
        }
        await addMoreAllProducts();
      }
    });

    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getAllProducts(
        pageNumber: allProductsPageNumber, pageSize: allProductsPageSize);
    if (response?.isSuccssed == true) {
      print("sss${response?.obj?.products?.first?.source}");
      allProducts = response?.obj?.products
              ?.map((e) => Product(
                    name: e.productName,
                    price: e.minorUnitPrice,
                    productId: e.id,
        productImagePath: e.file?.fileUrl,
        productSource: e.source?.toInt()??0
                  ))
              ?.toList() ??
          [];
      // allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();
      allProductsPageNumber++;
      emit(FetchingAllProductsSuccessState());
    } else if (response?.isSuccssed == false) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  addMoreAllProducts() async {
    emit(FetchingAllProductsMoreLoadingState());
    var response = await ProductsApis.getAllProducts(
        pageNumber: allProductsPageNumber, pageSize: allProductsPageSize);
    if (response?.isSuccssed == true) {
      var tempCustomerOrders = response?.obj?.products
              ?.map((e) => Product(
                    productId: e.id,
                    price: e.minorUnitPrice,
                    name: e.productName,
          productSource: e.source?.toInt()??0,
        productImagePath: e.file?.fileUrl,


      ))
              ?.toList() ??
          [];
      if (tempCustomerOrders?.isEmpty == true) {
        emit(FetchingAllProductsMoreSuccessState());
        return;
      }
      allProductsPageNumber++;
      allProducts?.addAll(tempCustomerOrders);
      emit(FetchingAllProductsMoreSuccessState());
    } else if (response?.isSuccssed == false) {
      emit(FetchingAllProductsMoreFailedState());
    } else {
      emit(FetchingAllProductsMoreNetworkConnectionFailedState());
    }
  }

  // setFirstCustomerOrders() async {
  //   LocaleCubit localeCubit = LocaleCubit.get(context);
  //   AppSettingsCubit appSettingsCubit = AppSettingsCubit.get(context);
  //   emit(GetFirstCustomerOrdersLoadingState());
  //   var response = await AccountApis.getCustomerOrders(1,
  //       currencyCode: appSettingsCubit.currencyCode,
  //       languageCode: languageCodes[localeCubit.locale.languageCode]);
  //   if (response?.success == 1) {
  //     customerOrders.clear();
  //     var tempCustomerOrders = response?.customerOrders ?? [];
  //     if (tempCustomerOrders.isEmpty == true) {
  //       emit(GetFirstCustomerOrdersSuccessState());
  //       return;
  //     }
  //     customerOrdersPageNumber++;
  //     customerOrders.addAll(tempCustomerOrders);
  //
  //     emit(GetFirstCustomerOrdersSuccessState());
  //   } else if (response?.success == 0) {
  //     customerOrders.clear();
  //     emit(GetFirstCustomerOrdersFailedState());
  //   } else {
  //     customerOrders.clear();
  //     emit(GetFirstCustomerOrdersNetworkConnectionFailedState());
  //   }
  // }

  // addMoreCustomerOrders() async {
  //   LocaleCubit localeCubit = LocaleCubit.get(context);
  //   AppSettingsCubit appSettingsCubit = AppSettingsCubit.get(context);
  //   emit(AddMoreCustomerOrdersLoadingState());
  //   var response = await AccountApis.getCustomerOrders(customerOrdersPageNumber,
  //       currencyCode: appSettingsCubit.currencyCode,
  //       languageCode: languageCodes[localeCubit.locale.languageCode]);
  //   if (response?.success == 1) {
  //     var tempCustomerOrders = response?.customerOrders ?? [];
  //     if (tempCustomerOrders.isEmpty == true) {
  //       emit(AddMoreCustomerOrdersSuccessState());
  //       return;
  //     }
  //     customerOrdersPageNumber++;
  //     customerOrders.addAll(tempCustomerOrders);
  //     emit(AddMoreCustomerOrdersSuccessState());
  //   } else if (response?.success == 0) {
  //     emit(AddMoreCustomerOrdersFailedState());
  //   } else {
  //     emit(AddMoreCustomerOrdersNetworkConnectionFailedState());
  //   }
  // }

  setAllNewArrivalsProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getNewArrivalsProducts(
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      // allProducts = response!.latestProducts;
      // allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();

      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  // setAllBestSellersProducts() async {
  //   emit(FetchingAllProductsLoadingState());
  //   var response = await CategoriesApis.getProductsInCategoryById(234,
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.success == 1) {
  //     allProducts = response?.products;
  //     allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();
  //
  //     emit(FetchingAllProductsSuccessState());
  //   } else if (response?.success == 0) {
  //     allProducts = null;
  //     emit(FetchingAllProductsFailedState());
  //   } else {
  //     allProducts = null;
  //     emit(FetchingAllProductsNetworkConnectionFailedState());
  //   }
  // }
  //
  // setAllFeaturedProducts() async {
  //   emit(FetchingAllProductsLoadingState());
  //   var response = await CategoriesApis.getProductsInCategoryById(236,
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.success == 1) {
  //     allProducts = response?.products;
  //     allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();
  //
  //     emit(FetchingAllProductsSuccessState());
  //   } else if (response?.success == 0) {
  //     allProducts = null;
  //     emit(FetchingAllProductsFailedState());
  //   } else {
  //     allProducts = null;
  //     emit(FetchingAllProductsNetworkConnectionFailedState());
  //   }
  // }
  //
  // setAllProductsInBrand() async {
  //   emit(FetchingAllProductsLoadingState());
  //   var response = await ProductsApis.getProductsInBrand(
  //       selectedBrand?.brandId?.toInt() ?? 0,
  //       languageCode: languageCodes[localeCubit?.locale.languageCode],
  //       currencyCode: appSettingsCubit?.currencyCode ?? "");
  //   if (response?.success == 1) {
  //     allProducts = response?.productsInBrand;
  //     allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();
  //     emit(FetchingAllProductsSuccessState());
  //   } else if (response?.success == 0) {
  //     allProducts = null;
  //     emit(FetchingAllProductsFailedState());
  //   } else {
  //     allProducts = null;
  //     emit(FetchingAllProductsNetworkConnectionFailedState());
  //   }
  // }

  setBrands() async {
    var response = await GetBrandsApi.getBrands(
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      brands = response?.brands;
    } else if (response?.success == 0) {
      brands = null;
    } else {
      brands = null;
    }
  }

  setVendorsOverview() async {
    var response = await VendorsApis.getVendors(pageNumber: 1, pageSize: 10);
    if (response?.isSuccssed == true) {
      vendors = response?.vendors;
    } else if (response?.isSuccssed == false) {
    } else {}
  }

  init() async {
    localeCubit = LocaleCubit.get(context);
    appSettingsCubit = AppSettingsCubit.get(context);
    emit(FetchingHomeScreenLoadingState());

    bool? isUserLoggedIn =
        MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    if (isUserLoggedIn == false && accessToken == null) {
      var success = await AuthCubit.get(context).setAccessToken();
      if (!success) {
        emit(FetchingHomeScreenNetworkFailedState());
        return;
      }
    }

    await setBanners();
    // await setBrands();
    await setCategoriesOverview();
    await setProductsOverview();
    await setVendorsOverview();
    // await setFeaturedProductsOverview();
    // await setNewArrivalsOverview();
    // await setBestSellersOverview();
    emit(FetchingHomeScreenDoneState());
  }

  setBanners() async {
    var response = await BannersApis.getBanners();

    if (response?.isSuccssed == true) {
      banners = response?.banners ?? [];
    }
  }
}
