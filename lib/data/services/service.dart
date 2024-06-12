abstract interface class IService {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });

  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });

  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
}
