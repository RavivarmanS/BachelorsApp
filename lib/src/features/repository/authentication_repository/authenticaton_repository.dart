import 'package:bachelorapp/src/features/core/screens/dashboards/dashboard.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:bachelorapp/src/features/screens/welcome_screen/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credentials) async {
          await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided Phone number is not valid');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var cerdentials=await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp));
    return cerdentials.user!= null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email,String password) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(() => const Dashboard()) : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex= SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    }catch(_){
      const ex=SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
    }

  Future<void> loginWithEmailAndPassword(String email,String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){

    }catch(_){}
  }
  Future<void> logout() async => await _auth.signOut();
}
