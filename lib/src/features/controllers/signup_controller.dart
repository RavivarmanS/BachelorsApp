import 'package:bachelorapp/src/features/models/user_model.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/authenticaton_repository.dart';
import 'package:bachelorapp/src/features/repository/user_repository/user_repository.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email= TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final address = TextEditingController();
  final userRepo = Get.put(UserRepository());

  void registerUSer(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }


  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}