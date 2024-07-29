import 'package:dio/dio.dart';
import 'package:todo_flutter_app/Api/Api.dart';
import 'package:todo_flutter_app/Api/CommonResponse.dart';

class DioServiceImpl extends Api {
  final dio = Dio();
  final String baseUrl = Api.baseUrl;

  @override
  Future<CommonResponse> get(Map<String, dynamic> params, String apiName) async {
    try {
      Response response = await dio.get("$baseUrl$apiName",queryParameters: params);    
      CommonResponse finalResp = CommonResponse.fromJson(response.data);
      return finalResp;
    } catch(ex) {
      return CommonResponse(
        status: -1,
        message: ex.toString(),
        success: false,
        data: null
      );
    }
  }

  @override
  Future<CommonResponse> post(Map<String, dynamic> params, String apiName) async {
    try {
      Response response = await dio.post("$baseUrl$apiName",data: params);    
      CommonResponse finalResp = CommonResponse.fromJson(response.data);
      return finalResp;
    } catch(ex) {
      return CommonResponse(
        status: -1,
        message: ex.toString(),
        success: false,
        data: null
      );
    }
  }
  
}