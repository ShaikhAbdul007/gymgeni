abstract interface class BaseClient {
  Future<dynamic> getData({required String url});
  Future<dynamic> postData({
    required String url,
    required Map<String, dynamic> body,
  });
}
