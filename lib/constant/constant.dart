
class EndPoint {
  static const baseurl = "https://watchstore.sasansafari.com/public/api/v1";
  static const sendSms = "$baseurl/send_sms";
  static const checkSmsCode = "$baseurl/check_sms_code";
  static const register = "$baseurl/register";
  static const productsByBrand = "$baseurl/products_by_brand/";
  static const productsByCategory = "$baseurl/products_by_category/";
  static const search = "$baseurl/search/";
  static const home = "$baseurl/home";
}

class ProductSortRoute{
  static const newestProducts = "/newest_products";
  static const cheapestProducts = "/cheapest_products";
  static const ostExpensiveProduct = "/most_expensive_product";
  static const mostViewedProducts = "/most_viewed_products";
}