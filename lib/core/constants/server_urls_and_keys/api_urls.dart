class ApiUrls {
  static const BASE_URL =
      "https://erp-test.net/";
  //  "https://m-caesari.com/";
  //"https://buqcha.net/";
  // "https://opencart3-simple.api.opencart-api.com/";
  static const GET_TOKEN_ENDPONT = "api/rest/oauth2/token/client_credentials";
  static const GET_SESSION_ID_ENDPOINT = "api/rest/session";
  static const LOGIN_ENDPOINT = "api/Users/LoginCustomer";
  static const REGISTER_ENDPOINT = "api/Users/RegisterCustomer";
  static const Complain_ENDPOINT = "api/ReceivingComplaints/Create";
  static const ACCOUNT_ENDPOINT = "api/rest/account";
  static const GET_CATEGORIES_ENDPOINT =

  "api/Products/GetGroups";
  //"api/Products/GetGroups";
    // "api/Stores/Group/GetAllPagenationWithImage";
      //"api/rest/categories/extended/";
  static const GET_BANNERS_ENDPOINT = "api/Banars/GetAllSelectList";
  static const GET_FEATURED_PRODUCTS_ENDPOINT = "api/rest/featured";
  static const GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT =
      "api/rest/featured/limit/";
  static const GET_NEW_ARRIVALS_ENDPOINT = "api/rest/latest";
  static const GET_NEW_ARRIVALS_LIMIT_ENDPOINT = "api/rest/latest/limit/";
  static const GET_BEST_SELLLERS_LIMIT_ENDPOINT = "api/rest/bestsellers/limit/";
  static const GET_SLIDE_SHOWS_ENDPOINT = "api/rest/slideshows";
  static const GET_PRODUCT_DETAILS_ENDPOINT = "api/rest/products/";
  static const GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT =
      "api/Products/GetAllCompanyProductsByGroup";
  static const GUEST_SHIPPING_ENDPOINT = "api/rest/guestshipping";
  static const GET_LIST_OF_COUNTRIES_ENDPOINT = "api/rest/countries";
  static const GET_LIST_OF_REGIONS_BY_COUNTRY_ID_ENDPOINT =
      "api/rest/countries/";
  static const CART_ENDPOINT = "api/rest/cart";
  static const ADD_ITEMS_TO_CART_ENDPOINT = "api/rest/cart_bulk";
  static const CREATE_GUEST_USER_ENDPOINT = 'api/rest/guest';
  static const GET_WISH_LIST_ENDPOINT = "api/UserFavouriteProduct/GetFavorites";
      //"api/rest/wishlist";
  static const ADD_TO_WISH_LIST_ENDPOINT =
      "api/UserFavouriteProduct/AddToFavorites";
      //"api/rest/wishlist/";
  static const LOGOUT_ENDPOINT = "api/rest/logout";
  static const CONFIRM_ORDER_ENDPOINT = "api/rest/confirm";
  static const GUEST_CHECKOUT_ENDPOINT = "api/rest/guestshipping";
  static const SHIPPING_METHODS_ENDPOINT = "api/rest/shippingmethods";
  static const PAYMENT_METHODS_ENDPOINT = "api/rest/paymentmethods";
  static const CUSTOMER_PAYMENT_ADDRESS_ENDPOINT = "api/rest/paymentaddress";
  static const SET_EXISTING_CUSTOMER_PAYMENT_ADDRESS_ENDPOINT =
      "api/rest/paymentaddress/existing";
  static const SET_EXISTING_CUSTOMER_SHIPPING_ADDRESS_ENDPOINT =
      "api/rest/shippingaddress/existing";
  static const SHIPPING_ADDRESS_ENDPOINT = "api/rest/shippingaddress";
  static const CHANGE_ACCOUNT_PASSWORD_ENDPOINT = "api/rest/account/password";
  static const ACCOUNT_ADDRESS_ENDPOINT = "api/rest/account/address";
  static const GET_CUSTOMER_ORDERS_ENDPOINT = "api/rest/customerorders/";
  static const SEARCH_ENDPOINT = "api/rest/products/search/";
  static const GET_LANGUAGES_ENDPOINT = "api/rest/languages";
  static const GET_SELECT_VALUES_ENDPOINT = "api/rest/product_classes";
  static const SET_COUPON_CODE_ENDPOINT = "api/rest/coupon";
  static const GET_BRANDS_ENDPOINT = "api/rest/manufacturers";
  static const GET_PRODUCTS_IN_BRAND_ENDPOINT = "api/rest/products";


  static const GET_ALL_PRODUCTS_ENDPOINT =

      "api/Products/GetAllCompanyProducts";
      //"api/Products/GetAllProducts";


  static const GET_VENDORS_ENDPOINT = "api/Products/GetVendors";



  static const GET_PRODUCTS_BY_VENDOR_ENDPOINT

  = "api/Products/GetAllVendorProductsByVendorId";


  static const ADD_TO_FAVORITES =  "api/UserFavouriteProduct/AddToFavorites";



  static const CANCEL_ORDER_ENDPOINT = "index.php?route=api/cancelorder";
  static const routeUrl = 'feed/rest_api/';
  static const CONTACT_US_ENDPOINT = "api/rest/contact";

  static String getFeaturedProductsWithLimitEndpoint(int limit) =>
      "$GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT$limit";
  static String getCategoriesEndpoint(int page) =>
      "$GET_CATEGORIES_ENDPOINT/limit/100/page/$page";
  static String getNewArrivalsProductsWithLimitEndpoint(int limit) =>
      "$GET_NEW_ARRIVALS_LIMIT_ENDPOINT$limit";
  static String getBestSellersWithLimitEndpoint(int limit) =>
      "$GET_BEST_SELLLERS_LIMIT_ENDPOINT$limit";
  static String getProductDetailsByIdEndpoint(int id) =>
      "$GET_PRODUCT_DETAILS_ENDPOINT$id";
  static String getProductsByCategoryIdEndpoint(int id) =>
      "$GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT";
  static String getListOfRegionsByCountryIdEndpoint(int id) =>
      "$GET_LIST_OF_REGIONS_BY_COUNTRY_ID_ENDPOINT$id";
  static String getAddItemsToWishlistEndpoint(int id) =>
      "$ADD_TO_WISH_LIST_ENDPOINT$id";
  static String getDeleteItemsFromWishlistEndpoint() =>
      "api/UserFavouriteProduct/RemoveFromFavorites";
  static String getEditOrDeleteAccountAddressEndpoint(int id) =>
      "$ACCOUNT_ADDRESS_ENDPOINT/$id";
  static String getCustomerOrdersEndpoint(int page) =>
      "${GET_CUSTOMER_ORDERS_ENDPOINT}limit/10/page/$page";
  static String getCustomerOrderDetailsEndpoint(int orderId) =>
      "$GET_CUSTOMER_ORDERS_ENDPOINT$orderId";
  static String getAccountAddressEndpoint(int addressId) =>
      "$ACCOUNT_ADDRESS_ENDPOINT/$addressId";
  static String getSearchByTermEndpoint(String searchTerm) =>
      "$SEARCH_ENDPOINT$searchTerm";
  static String getProductsInBrandEndpoint(int id) =>
      "$GET_PRODUCTS_IN_BRAND_ENDPOINT{$id}";


  static const GET_COMPANY_PRODUCT_DETAILS_BY_ID_ENDPOINT = "api/Products/GetCompanyProduct";

  static const GET_ALL_NOTIFICATIONS_ENDPOINT = "api/SendNotifications/GetAllSelectList";

  //used products

  static const ADD_USED_PRODUCT_ENDPOINT =
      "https://taskmanagement.semicolonsys.com/caser/services/api/add-product";

  static const GET_USED_PRODUCTS_BY_CLIENTS_ENDPOINT =
      "https://taskmanagement.semicolonsys.com/caser/services/api/all-products-users?pageNumber=1&pageSize=1000";

  static const GET_USED_PRODUCTS_BY_COMPANY_ENDPOINT =
      "https://taskmanagement.semicolonsys.com/caser/services/api/all-products-admins?pageNumber=1&pageSize=1000";

  static const SEND_EMAIL_ENDPOINT =
      "https://erp-alnuqta.com/caser/services/Api/add-support?projectId=1";

  static const USED_PRODUCTS_FEATURE_BASE_URL =
      "https://taskmanagement.semicolonsys.com/caser/";
}
