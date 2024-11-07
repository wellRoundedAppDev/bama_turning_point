import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/data/models/get_products_in_category_response.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_brands_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
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
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../categories/data/models/get_categories_response.dart';
import '../../../../contact_us/data/data_sources/remote_data_sources/contact_us_api.dart';
import '../../../data/models/get_brands_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;
  LocaleCubit? localeCubit;
  AppSettingsCubit? appSettingsCubit;

  //data
  // List<BannerAd>? banners;
  List<String> banners = [
    'assets/images/slider1.jpeg',
    'assets/images/slider2.jpeg',
    'assets/images/slider3.jpeg',
    'assets/images/slider4.jpeg',
    'assets/images/slider5.jpg',
  ];

  List<Category>? categoriesOverview;
  List<Category>? allCategories;
  List<Product>? allProducts;
  // List<FeaturedProduct>? featuredProductsOverview;
  // List<FeaturedProduct>? allFeaturedProducts;
  List<LatestProduct>? newArrivalsProductsOverview;
  //List<LatestProduct>? allNewArrivals;
  List<ProductInCategory>? bestSellersProductsOverview;
  List<ProductInCategory>? featuredProductsOverview;

  List<Brand>? brands;
  List<ProductsInBrand>? productsInBrand;

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
    if (productsListTitle == "Featured Products") {
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
    } else if (productsListTitle == "New Arrivals") {
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
    } else {
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
      setAllProductsInBrand();
      return;
    }

    if (productsListTitle == AppLocalizations.of(context)!.featured_products) {
      setAllFeaturedProducts();
    } else if (productsListTitle ==
        AppLocalizations.of(context)!.new_arrivals) {
      setAllNewArrivalsProducts();
    } else {
      setAllBestSellersProducts();
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
  setFeaturedProductsOverview() async {
    var response = await CategoriesApis.getProductsInCategoryById(236,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      featuredProductsOverview = response?.products;
      featuredProductsOverview =
      featuredProductsOverview?.where((e) => e.stockStatusId != 5)?.toList();

    } else if (response?.success == 0) {
      featuredProductsOverview = null;
    } else {
      featuredProductsOverview = null;
    }
  }

  setNewArrivalsOverview() async {
    var response = await ProductsApis.getNewArrivalsProductsOverview(
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      newArrivalsProductsOverview = response?.latestProducts;
      newArrivalsProductsOverview = newArrivalsProductsOverview?.where((e) => e.stockStatusId != 5)?.toList();


    } else if (response?.success == 0) {
      newArrivalsProductsOverview = null;
    } else {
      newArrivalsProductsOverview = null;
    }
  }

  setBestSellersOverview() async {
    var response = await CategoriesApis.getProductsInCategoryById(234,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      bestSellersProductsOverview = response?.products;
      bestSellersProductsOverview = bestSellersProductsOverview?.where((e) => e.stockStatusId != 5)?.toList();

    } else if (response?.success == 0) {
      bestSellersProductsOverview = null;
    } else {
      bestSellersProductsOverview = null;
    }
  }

  setCategoriesOverview() async {
    var response = await CategoriesApis.getCategories(1,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");

    if (response?.success == 1) {
      categoriesOverview = response?.categories;
    } else if (response?.success == 0) {
      categoriesOverview = null;
    } else {
      categoriesOverview = null;
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

  setAllNewArrivalsProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getNewArrivalsProducts(
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      allProducts = response?.latestProducts;
      allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();

      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  setAllBestSellersProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await CategoriesApis.getProductsInCategoryById(234,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      allProducts = response?.products;
      allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();

      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  setAllFeaturedProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await CategoriesApis.getProductsInCategoryById(236,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      allProducts = response?.products;
      allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();

      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  setAllProductsInBrand() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getProductsInBrand(
        selectedBrand?.brandId?.toInt() ?? 0,
        languageCode: languageCodes[localeCubit?.locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.success == 1) {
      allProducts = response?.productsInBrand;
      allProducts = allProducts?.where((e) => e.stockStatusId != 5)?.toList();
      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

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

    //await setBanners();
    await setBrands();
    await setCategoriesOverview();
    await setFeaturedProductsOverview();
    await setNewArrivalsOverview();
    await setBestSellersOverview();
    emit(FetchingHomeScreenDoneState());
  }
}
