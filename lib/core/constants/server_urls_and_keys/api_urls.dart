class ApiUrls {
  static const BASE_URL = "http://Northgrass.co/";
  // "https://opencart3-simple.api.opencart-api.com/";
  static const GET_TOKEN_ENDPONT = "api/rest/oauth2/token/client_credentials";
  static const GET_SESSION_ID_ENDPOINT = "api/rest/session";
  static const LOGIN_ENDPOINT = "api/rest/login";
  static const REGISTER_ENDPOINT = "api/rest/register";
  static const ACCOUNT_ENDPOINT = "api/rest/account";
  static const GET_CATEGORIES_ENDPOINT = "api/rest/categories/extended/";
  static const GET_BANNERS_ENDPOINT = "api/rest/banners";
  static const GET_FEATURED_PRODUCTS_ENDPOINT = "api/rest/featured";
  static const GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT =
      "api/rest/featured/limit/";
  static const GET_NEW_ARRIVALS_ENDPOINT = "api/rest/latest";
  static const GET_NEW_ARRIVALS_LIMIT_ENDPOINT = "api/rest/latest/limit/";
  static const GET_BEST_SELLLERS_LIMIT_ENDPOINT = "api/rest/bestsellers/limit/";
  static const GET_SLIDE_SHOWS_ENDPOINT = "api/rest/slideshows";
  static const GET_PRODUCT_DETAILS_ENDPOINT = "api/rest/products/";
  static const GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT =
      "api/rest/products/category/";
  static const GUEST_SHIPPING_ENDPOINT = "api/rest/guestshipping";
  static const GET_LIST_OF_COUNTRIES_ENDPOINT = "api/rest/countries";
  static const GET_LIST_OF_REGIONS_BY_COUNTRY_ID_ENDPOINT =
      "api/rest/countries/";
  static const CART_ENDPOINT = "api/rest/cart";
  static const ADD_ITEMS_TO_CART_ENDPOINT = "api/rest/cart_bulk";
  static const CREATE_GUEST_USER_ENDPOINT = 'api/rest/guest';
  static const GET_WISH_LIST_ENDPOINT = "api/rest/wishlist";
  static const ADD_TO_WISH_LIST_ENDPOINT = "api/rest/wishlist/";
  static const LOGOUT_ENDPOINT = "api/rest/logout";
  static const CONFIRM_ORDER_ENDPOINT = "api/rest/confirm";
  static const GUEST_CHECKOUT_ENDPOINT = "api/rest/guestshipping";
  static const SHIPPING_METHODS_ENDPOINT = "api/rest/shippingmethods";
  static const PAYMENT_METHODS_ENDPOINT = "api/rest/paymentmethods";
  static const CUSTOMER_PAYMENT_ADDRESS_ENDPOINT = "api/rest/paymentaddress";
  static const SET_EXISTING_CUSTOMER_PAYMENT_ADDRESS_ENDPOINT = "api/rest/paymentaddress/existing";
  static const SHIPPING_ADDRESS_ENDPOINT = "api/rest/shippingaddress";
  static const CHANGE_ACCOUNT_PASSWORD_ENDPOINT = "api/rest/account/password";
  static const ACCOUNT_ADDRESS_ENDPOINT = "api/rest/account/address";
  static const GET_CUSTOMER_ORDERS_ENDPOINT = "api/rest/customerorders/";

  static String getFeaturedProductsWithLimitEndpoint(int limit) =>
      "$GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT$limit";
  static String getCategoriesEndpoint(int page) =>
      "$GET_CATEGORIES_ENDPOINT/limit/10/page/$page";
  static String getNewArrivalsProductsWithLimitEndpoint(int limit) =>
      "$GET_NEW_ARRIVALS_LIMIT_ENDPOINT$limit";
  static String getBestSellersWithLimitEndpoint(int limit) =>
      "$GET_BEST_SELLLERS_LIMIT_ENDPOINT$limit";
  static String getProductDetailsByIdEndpoint(int id) =>
      "$GET_PRODUCT_DETAILS_ENDPOINT$id";
  static String getProductsByCategoryIdEndpoint(int id) =>
      "$GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT$id";
  static String getListOfRegionsByCountryIdEndpoint(int id) =>
      "$GET_LIST_OF_REGIONS_BY_COUNTRY_ID_ENDPOINT$id";
  static String getAddItemsToWishlistEndpoint(int id) =>
      "$ADD_TO_WISH_LIST_ENDPOINT$id";
  static String getDeleteItemsFromWishlistEndpoint(int id) =>
      "$ADD_TO_WISH_LIST_ENDPOINT$id";
  static String getEditOrDeleteAccountAddressEndpoint(int id) =>
      "$ACCOUNT_ADDRESS_ENDPOINT/$id";
  static String getCustomerOrdersEndpoint(int page) =>
      "${GET_CUSTOMER_ORDERS_ENDPOINT}limit/10/page/$page";
  static String getCustomerOrderDetailsEndpoint(int orderId) =>
      "$GET_CUSTOMER_ORDERS_ENDPOINT$orderId";
  static String getAccountAddressEndpoint(int addressId) =>
      "$ACCOUNT_ADDRESS_ENDPOINT/$addressId";

}
