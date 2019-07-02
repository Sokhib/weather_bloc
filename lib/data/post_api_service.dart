import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/v1')
abstract class PostApiService extends ChopperService {
  @Get(path: 'current.json?key=6bf7dfb2d536499495b144936192906&q={q}')
  Future<Response> getWeather(@Path() String q);

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: 'http://api.apixu.com',
        services: [
          _$PostApiService(),
        ],
        converter: JsonConverter());
    return _$PostApiService(client);
  }
}
