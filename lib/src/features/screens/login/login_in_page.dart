import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/auth_service.dart';
import 'package:bachelorapp/src/utils/components/my_Button.dart';
import 'package:bachelorapp/src/utils/components/my_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;
  Login_Page({super.key,required this.onTap});

  //login Method
  void Login(BuildContext context) async{
    // auth service
    final authService = AuthService();
    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
        
            Image(image: AssetImage(uniteImage),height: 300,),
            //Welcome back message
            Text(
              welcomeBack,
              style: TextStyle(fontSize: 16.0),
            ),
            //email textfield
            MyTextField(
              hintText: "Email",
              obscucreText: false,
              controller: _emailController,
            ),
        
            const SizedBox(
              height: 10,
            ),
            //pw textfield
            MyTextField(
              hintText: "Password",
              obscucreText: true,
              controller: _pwController,
            ),
            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              text: login,
              onTap:()=> Login(context),
            ),
            const SizedBox(
              height: 25,
            ),
        
            //register now
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 150)),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
