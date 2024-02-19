
import 'package:bachelorapp/src/features/repository/authentication_repository/authenticaton_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  // Future<void> loginUser(String email, String password)async{
  //   String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email,password);
  //   if(error != null){
  //     Get.showSnackbar(GetSnackBar(message: error.toString()));
  //   }
  // }
}