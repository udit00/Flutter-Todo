import 'package:todo_flutter_app/Api/CommonResponse.dart';
import 'package:todo_flutter_app/Api/DioService.dart';

abstract class Api {
  static const String _appName = "todo";
  // static const String _appName = "todo";
  static const String baseUrl = "http://157.173.218.215:5000/$_appName/";
  Future<CommonResponse> get(Map<String, dynamic> params, String apiName);
  Future<CommonResponse> post(Map<String, dynamic> params, String apiName);
}

class ApiService extends DioServiceImpl{  
  ApiService._privateConstructor();

  static final ApiService _instance = ApiService._privateConstructor();

  factory ApiService() {
    return _instance;
  }
}
