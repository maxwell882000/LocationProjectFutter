/* part ‘api_client.g.dart’;
///APIs class is for api tags
class Apis {
  static const String users = '/users';
}
@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseData> getUsers();
} */