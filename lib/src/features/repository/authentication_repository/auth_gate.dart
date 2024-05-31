import 'package:bachelorapp/src/features/authentication/login_or_register.dart';
import 'package:bachelorapp/src/features/core/screens/dashboards/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return const Dashboard();
          }
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}