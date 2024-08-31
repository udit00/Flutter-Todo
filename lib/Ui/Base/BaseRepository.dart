import 'dart:async';

import 'package:todo_flutter_app/Api/Api.dart';

class BaseRepository {
  StreamController<String> errorStream = StreamController();
  StreamController<bool> loadingStream = StreamController();
  ApiService apiService = ApiService();
}