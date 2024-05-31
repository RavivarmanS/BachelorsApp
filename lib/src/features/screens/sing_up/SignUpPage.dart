import 'package:bachelorapp/src/features/repository/authentication_repository/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants/Text/Text.dart';
import '../../../constants/image_strings/images.dart';
import '../../../utils/components/my_Button.dart';
import '../../../utils/components/my_textField.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  SignUpPage({super.key, required this.onTap});

  //Register Method
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      }catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }
    else{
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Password doesn't match"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Image(image: AssetImage(uniteImage), height: 300,),
            //Welcome back message
            Text(
              "Let's create an account for you",
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
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm Password",
              obscucreText: true,
              controller: _confirmPwController,
            ),
            const SizedBox(
              height: 10,
            ),
            //login button
            MyButton(
              text: "Register",
              onTap: ()=>register(context),
            ),
            const SizedBox(
              height: 25,
            ),

            //register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 150)),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
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
