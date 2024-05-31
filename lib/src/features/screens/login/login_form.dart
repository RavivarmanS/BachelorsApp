import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/core/screens/dashboards/dashboard.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_options/ForgetPasswordBtnWidget.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_options/ForgetPassword_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: formHeight - 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: Email,
              hintText: Email,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: formHeight - 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint_outlined),
                labelText: Password,
                hintText: Password,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_outlined))),
          ),
          const SizedBox(
            height: formHeight - 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: Text('Forget Password?'))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black45
                  ),
                ),
                  onPressed: () {
                    Get.to(() => Dashboard());
                  }, child: Text(login.toUpperCase())))
        ],
      ),
    ));
  }

}


