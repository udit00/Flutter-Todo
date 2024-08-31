import 'package:todo_flutter_app/Api/CommonResponse.dart';
import 'package:todo_flutter_app/Ui/Base/BaseRepository.dart';

class HomeRepository extends BaseRepository {
  Future<CommonResponse> getTodos(Map<String, String> params) async {
    return await apiService.get(params, "getTodos");
  }
}