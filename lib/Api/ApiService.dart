import 'package:todo_flutter_app/Api/Api.dart';

class ApiService {
  static Api? _instance;  
  static Api getInstance() {
    return _instance ??= Api();    
  }
  static String internetError = "No internet connection.";
  static String commonError = "Something went wrong.";
}