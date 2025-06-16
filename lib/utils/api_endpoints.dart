class ApiEndPoints {
  // static const String baseUrl = 'http://192.168.0.109:2001';
  // static const String baseUrl = 'http://192.168.0.105:2001';
  // static const String baseUrl = '8.8.8.8:2001';
  static const String baseUrl = 'https://solution-backend.vercel.app';
  static Auth auth = Auth();
  static Store store = Store();
  static Product product = Product();
  static Order order = Order();
  static Customer customer = Customer();
}

class Auth {
  final String register = '/auth-account/registration';
  final String login = '/user/login';
  final String loginPin = '/user/login/pin';
  final String signUp = '/user';
  final String getUser = '/user/me';
  final String createAccount = '/user';
  final String sendOtp = '/user/send_otp';
  final String verifyOtp = '/user/verified';
}

class Store {
  final String getStoreData = '/store';
  final String storeUpdate = '/store/update';
  final String storeCoupon = '/store/coupon';
  final String addProductToStore = '/store/product';
  final String getStoreProducts = '/store/product';
  final String getStoreCategory = '/store/category';
  final String getCoupon = '/coupon';
  final String switchCoupon = '/coupon/apply/store';
  final String folder = '/store/folder';
}

class Product {
  final String getCategoryData = '/product/category';
  final String postProductData = '/product';
  final String getProductData = '/product';
  final String getProductByCompany = '/product/brand';
  final String getProductTags = '/product/tags';
}

class Order {
  final String getStoreOrderProducts = '/order/store/products';
  final String getOrder = '/order';
  final String getPaymentStatus = '/order/status';
  final String postOrderData = '/order/ssl-commerz';
  final String orderTotal = '/order/total';
  final String orderRequest = '/order/request/store';
  final String requestOrderToOrder = '/order/request/to-order';
}
class Customer {
  final String getAllCustomers = '/customer';
  final String getAllCustomersList = '/customer/list';
  final String getCustomers = '/customer';
  final String postOrderData = '/order/ssl-commerz';
  final String getCustomerSuggest = '/customer/suggest';
}
