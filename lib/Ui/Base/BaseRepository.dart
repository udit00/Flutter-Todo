import 'dart:async';

class BaseRepository {
  StreamController<String> errorStream = StreamController();
  StreamController<bool> loadingStream = StreamController();    
}