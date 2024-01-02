import 'dart:async';

class BaseViewModel {
  StreamController<String> errorStream = StreamController();
  StreamController<bool> loadingStream = StreamController();    
}