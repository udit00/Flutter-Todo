import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Ui/CommonUi/ScreenDimension.dart';
import 'package:todo_flutter_app/Utils/Colors.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const _SplashScreenPagState(),
    );
  }
}


class _SplashScreenPagState extends StatefulWidget {
  const _SplashScreenPagState({super.key});

  @override
  State<_SplashScreenPagState> createState() => __SplashScreenPagStateState();
}

class __SplashScreenPagStateState extends State<_SplashScreenPagState> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ScreenDimension.setDimensions(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => Future.delayed(Duration(seconds: 3), () {
      _goToLoginPage();
        })
    );
  }

  _goToLoginPage() {
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const LoginWithPasswordPageState()), (fooBar) => false);
  }
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child: 
    Column(      
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'TO-DO',                  
        style: TextStyle(
          color: CommonColors.colorPrimary,          
          fontSize: 54
        )
        ),
        Icon(Icons.checklist,color: CommonColors.colorPrimary, size: 200,),
        const CircularProgressIndicator()
      ],
    ),
    );

  }
}