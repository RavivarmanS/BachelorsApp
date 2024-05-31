import 'package:bachelorapp/firebase_options.dart';
import 'package:bachelorapp/src/features/authentication/login_or_register.dart';
import 'package:bachelorapp/src/features/core/screens/dashboards/dashboard.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/auth_gate.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/authenticaton_repository.dart';
import 'package:bachelorapp/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      home: AuthGate(),


    );
  }
}



