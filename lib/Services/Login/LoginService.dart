import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Services/Storage/StorageService.dart';
import 'package:todo_flutter_app/Services/Toast/ToastService.dart';
import 'package:todo_flutter_app/Ui/Pages/BottomNavigation/MyBottomNavigation.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/Login.dart';

class LoginService {
  BuildContext? _context;
  StorageService? _storage;
  LoginService(BuildContext? contextInstance) {
    _context = contextInstance;
    _storage = StorageService();
  }

  void setContext(BuildContext? contextInstance) {
    _context = contextInstance;    
  }

  bool ifAlreadyLogginInBefore() {
    if(_storage == null) {
      debugPrint("Storage was null at $runtimeType");
      ToastService.errorToast("Something went wrong, Please login again.");
      return false;
    }
    bool isLoggedIn = _storage?.getBoolFromStorage(_storage?.isLoggedInPref ?? "") ?? false;
    return isLoggedIn;
  }

  void loginUser() async {
    if(_context == null) {
      debugPrint('Context was null at $runtimeType');
      return;
    }
    _storage?.saveBoolToStorage(_storage?.isLoggedInPref ?? "", true).then((isSaved) => {
      if(isSaved) {
        Navigator.pushAndRemoveUntil(
              _context!,
              MaterialPageRoute(builder: (context) => const MyBottomNavigation()), (fooBar) => false)
      } else {
        ToastService.errorToast("Something went wrong. Please try again.")
      }
    });
    
  }

  void logoutUser() async {
    if(_context == null) {
      debugPrint('Context was null at $runtimeType');
      return;
    }
    _storage?.saveBoolToStorage(_storage?.isLoggedInPref ?? "", false).then((isSaved) => {
      if(isSaved) {        
        Navigator.pushAndRemoveUntil(
          _context!,
          MaterialPageRoute(builder: (context) => const LoginWithPasswordPageState()), (fooBar) => false)
      } else {
        ToastService.errorToast("Something went wrong. Please try again.")
      }
    });
  }
}