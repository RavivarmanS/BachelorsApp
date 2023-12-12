
import 'package:bachelorapp/src/features/core/screens/dashboards/dashboard.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/authenticaton_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}