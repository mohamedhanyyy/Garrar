class ApiEndPoints {
  static const String baseUrl = 'https://apptest.garrar.net/api/';
  static const String loginUrl = 'provider/oauth/token';
  static const String registerUrl = 'shipper/register';
  static const String emailVerificationUrl = 'email/verify/44?expires='
      '1671625298&signature=03438fa6d4dd4bedf07d748968ed8a14a3896'
      '4ea67348c050dc1392bf052f69e';

  static const String changePasswordUrl = 'change/password';

  Map<String, dynamic> headers = {};
}
