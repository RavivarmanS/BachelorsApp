import 'package:bachelorapp/src/features/screens/login/login_in_page.dart';
import 'package:bachelorapp/src/features/screens/sing_up/SignUpPage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage=true;

  void togglePages(){
    setState(() {
      showLoginPage = ! showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login_Page(
        onTap: togglePages,
      );
    }else{
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}
