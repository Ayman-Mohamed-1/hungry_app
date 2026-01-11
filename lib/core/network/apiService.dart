import 'package:hungry_app/core/network/apiClient.dart';

class ApiService {
  final ApiClient apiclient;
  ApiService(this.apiclient);

  Future<dynamic> getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) {
    return apiclient.get(endPoint: endPoint, query: query);
  }

  Future<dynamic> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) {
    return apiclient.post(endPoint: endPoint, data: data);
  }

  Future<dynamic> putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) {
    return apiclient.put(endPoint: endPoint, data: data);
  }

  Future<dynamic> deleteRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) {
    return apiclient.delete(endPoint: endPoint, data: data);
  }
}
