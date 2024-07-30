import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Services/Toast/ToastService.dart';
import 'package:todo_flutter_app/Ui/CommonUi/AppInputs.dart';
import 'package:todo_flutter_app/Ui/Pages/Login/LoginViewModel.dart';
import 'package:todo_flutter_app/Utils/Colors.dart';

class LoginWithPasswordPageState extends StatefulWidget {
  const LoginWithPasswordPageState({super.key});

  @override
  State<LoginWithPasswordPageState> createState() => _LoginWithPasswordPageStateState();
}

class _LoginWithPasswordPageStateState extends State<LoginWithPasswordPageState> {


  ValueNotifier obsecurePassword = ValueNotifier(true);
  TextEditingController mobileController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  LoginViewModel viewModel = LoginViewModel();
  @override
  void initState() {
    super.initState();
    // ScreenDimension.setDimensions(context);
    setObservers();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mobileController.text = "7011490531";
      passwordController.text = "Udit@123";
    });
  }


  void setObservers() {
    viewModel.errorStream.stream.listen((errMsg) { 
      ToastService.errorToast(errMsg);
    });
    viewModel.loadingStream.stream.listen((loading) {

    });
    viewModel.loginDataStream.stream.listen((loginData) { 
      ToastService.successToast(loginData.message.toString());
      // storageService.getLoginData().then((loginUserModel) => {
      //   debugPrint(loginUserModel?.pass?.toString())
      // });
      print(loginData);
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, loginViewModel, child) {
        return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'TO-DO',                  
                style: TextStyle(
                  color: CommonColors.colorPrimary,          
                  fontSize: 54
                )
              ),
              Icon(Icons.checklist,color: CommonColors.colorPrimary, size: 100,),
              // Image.asset(
              //   'assets/images/logo.png',
              //   height: 200,
              //   scale: 2.5,
              // ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppInputs(
                      labelText: "Enter Mobile Number",
                      textInputType: TextInputType.number,
                      textController: mobileController,
                      focusNode: emailFocusNode)),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: passwordController,
                        obscureText: obsecurePassword.value,
                        obscuringCharacter: "*",
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: CommonColors.colorBlack),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: CommonColors.colorBlack, width: 1.0),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "Enter your password",
                          suffixIcon: InkWell(
                              onTap: () {
                                obsecurePassword.value = !obsecurePassword.value;
                              },
                              child: obsecurePassword.value
                                  ? Icon(Icons.visibility_off,
                                      color: CommonColors.colorBlack)
                                  : Icon(Icons.visibility_outlined,
                                      color: CommonColors.colorBlack)),
                        ),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, RoutesName.forgot_password);
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Forgot Password",
                          style: Theme.of(context).textTheme.bodyMedium)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: ElevatedButton(                
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
                    backgroundColor: MaterialStatePropertyAll(CommonColors.colorPrimary),
                  ),                
                  onPressed: () => viewModel.userLogin(mobileController.text, passwordController.text),
                  child: Text('Login', style: TextStyle(color: CommonColors.colorWhite),)
                ),
              )
            ],
          ),
        ),
      ));
      },
    );
  }
}