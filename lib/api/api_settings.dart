class ApiSettings {
  static const String _baseUrl = 'https://smart-store.mr-dev.tech/api/';
  static const String login = '${_baseUrl}auth/login';
  static const String register = '${_baseUrl}auth/register';
  static const String logout = '${_baseUrl}auth/logout';
  static const String activate = '${_baseUrl}auth/activate';
  static const String cities = '${_baseUrl}cities';
  static const String categories = '${_baseUrl}categories/{id}';
  static const String products = '${_baseUrl}sub-categories/{id}';
  static const String productDetails = '${_baseUrl}products/{id}';
  static const String addresses = '${_baseUrl}addresses/{id}';
  static const String orders = '${_baseUrl}orders/{id}';
}
