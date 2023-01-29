class MyHttpException implements Exception {
  final String msg;
  final int statusCode;

  MyHttpException({required this.msg, required this.statusCode});
}
