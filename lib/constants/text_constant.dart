class TextConstants {
  const TextConstants._();

  static const findYourProduct = 'Find your\nProduct';
  static const welcomeBack = 'Welcome\nback';
  static const email = 'Email';
  static const login = 'Login';
  static const password = 'Password';
  static const show = 'Show';
  static const forgotPasscode = 'Forgot passcode?';
  static const loginAcc = 'Login Account';
  static const itemNotFound = 'Item not found';
  static const itemNotFoundDesc =
      'Try a more generic search term or try looking for alternative products.';
  static const fullDesc = 'Full Description';
  static const total = 'Total';
  static const addToBasket = 'Add to basket';
  static const deliveryNotice = 'Delivery for FREE until the end of the month';
  static const checkout = 'Checkout';
  static const shippingInfo = 'Shipping information';
  static const change = 'change';
  static const paymentMethod = 'Payment Method';
  static const confirmAndPay = 'Confirm and pay';
  static const products = 'Products';
  static const myCreditCard = 'My credit card';
  static const payNow = 'Pay now';
  static const noFavYet = 'No favorites yet';
  static const startOrderingDesc =
      'Hit the orange button down\nbelow to Create an order';
  static const startOrdering = 'Start ordering';
  static const search = 'Search';
  static const orderOnlineLabel = 'Order online\ncollect in store';
  static const seeMore = 'see more';
  static const basket = 'Basket';
  static const favorites = 'Favorites';
  static const myProfile = 'My profile';
  static const orderHistory = 'Order History';
  static const address = 'Address';
  static const editProfile = 'Edit Profile';
  static const shoppingAddress = 'Shopping address';
  static const cards = 'Cards';
  static const noHistoryYet = 'No history yet';
  static const profile = 'Profile';
  static const myOrders = 'My Orders';
  static const delivery = 'Delivery';
  static const settings = 'Settings';
  static const signOut = 'Sign out';
  static const noInternetConnection = 'No internet Connection';
  static const noInternetDesc =
      'Your internet connection is currently not available please check or try again.';
  static const tryAgain = 'Try again';
  static const getStarted = 'Get started';
  static const hide = 'Hide';
  static const createAccount = 'Create Account';
  static const home = 'Home';
  static const colors = 'Colors';
  static const quantity = 'Quantity';
  static const confirmPassword = 'Confirm Password';
  static const shippingAddress = 'Shipping Address';
  static const phoneNo = 'Phone No.';
}

extension BreakLine on String {
  String breakLine() {
    final splits = split(' ');
    String finalString = '';
    for (String data in splits) {
      finalString += '$data\n';
    }
    return finalString;
  }
}
