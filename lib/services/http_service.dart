import 'package:dio/dio.dart';
import '../model/appConfig.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();

  Appconfig? _appconfig;
  String? _base_url;
  String? _api_key;

  HttpService() {
    _appconfig = GetIt.instance.get<Appconfig>();
    _base_url = _appconfig!.COIN_API_BASE_URL;
    _api_key = _appconfig!.API_KEY;

    dio.options.headers['x-cg-pro-api-key'] = '$_api_key';
  }

  Future<Response?> get(String _path) async {
    try {
      String _url = "$_base_url$_path";
      Response? _response = await dio.get(_url);
      return _response;
    } catch (e) {
      print("HTTPService: Enable to perform get requset.");
      print(e);
    }
  }
}
