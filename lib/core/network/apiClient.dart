abstract class ApiClient {
  Future<dynamic> get({required String endPoint, Map<String, dynamic>? query});
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  });
  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
  });
  Future<dynamic> delete({
    required String endPoint,
    required Map<String, dynamic> data,
  });
}
