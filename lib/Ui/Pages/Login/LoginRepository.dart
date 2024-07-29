import 'dart:async';
import 'package:todo_flutter_app/Api/Api.dart';
import 'package:todo_flutter_app/Api/CommonResponse.dart';
import 'package:todo_flutter_app/Ui/Base/BaseRepository.dart';

class LoginRepository extends BaseRepository{
  // Future<void> userLogin(Map<String, String> params) async {
  //   try {
  //     var rawResponse = await ApiService.getInstance().apiPost("userLogin", params);
  //     if(rawResponse.statusCode == 200) {
  //       dynamic json = jsonDecode(rawResponse.body);
  //       CommonResponse commonResponse = CommonResponse.fromJson(json);
  //       if(commonResponse.status == 1) {
  //         // List<LoginUserModel> weightData =
  //         //   mapData.entries.map( (entry) => LoginUserModel(entry.key, entry.value)).toList();
  //         // LoginUserModel? loginUserModel = LoginUserModel.fromJson(commonResponse.data);
  //         dynamic rawLogin = commonResponse.data.first;
  //         LoginUserModel loginUserModel = LoginUserModel.fromJson(rawLogin);
  //         if(loginUserModel != null) {
  //           loginDataStream.add(loginUserModel);
  //           print(loginUserModel.toString());
  //         } else {
  //           errorStream.add(ApiService.commonError);
  //         }        
  //       } else {
  //         errorStream.add(commonResponse.message.toString());
  //       }
  //     } else {
  //       errorStream.add(ApiService.commonError);
  //     }
  //   } catch(ex) {
  //     errorStream.add(ex.toString());
  //   }
  // }

  Future<CommonResponse> userLogin(Map<String, String> params) async {  
    return await ApiService().post(params, "userLogin");
  }
}