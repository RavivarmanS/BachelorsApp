import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/controllers/signup_controller.dart';
import 'package:bachelorapp/src/features/models/user_model.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatefulWidget {
   SignUpFormWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();

   final controller = Get.put(SignUpController());

   bool _shouldAutofocus = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Form(
            key: _formKey,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _shouldAutofocus = true; // Enable autofocus on tap
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.fullName,
                      decoration: const InputDecoration(
                          label: Text(fullName),
                          prefixIcon: Icon(Icons.person_outline_rounded)),

                    ),
                    const SizedBox(
                      height: formHeight - 10,
                    ),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                          label: Text(Email), prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(
                      height: formHeight - 10,
                    ),
                    TextFormField(
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                          label: Text(phNo), prefixIcon: Icon(Icons.call_outlined)),
                    ),
                    const SizedBox(
                      height: formHeight - 10,
                    ),
                    TextFormField(
                      controller: controller.password,
                      decoration: const InputDecoration(
                          label: Text(Password),
                          prefixIcon: Icon(Icons.password_outlined)),
                    ),
                    const SizedBox(
                      height: formHeight - 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final user = UserModel(
                                email: controller.email.text.trim(),
                                fullName: controller.fullName.text.trim(),
                                password: controller.password.text.trim(),
                                phoneNo: controller.phoneNo.text.trim());
                            SignUpController.instance.createUser(user);
                            Get.to(() => OTPScreen());

                          }
                        },
                        child: Text(
                          signUp.toUpperCase(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
