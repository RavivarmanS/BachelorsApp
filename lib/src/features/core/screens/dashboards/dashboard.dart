import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/features/repository/authentication_repository/auth_service.dart';
import 'package:bachelorapp/src/features/screens/owner_screen/owner.dart';
import 'package:bachelorapp/src/features/screens/services_screen/service.dart';
import 'package:bachelorapp/src/features/screens/tenent_screen/tenent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {

  const Dashboard({super.key});
  void logout(){
    final _auth = AuthService();
    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(welcomeTitle),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                  child: Text(tenent.toUpperCase()),
                  onPressed: () {
                    Get.to(()=>TenentScreen());
                  },
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(owner.toUpperCase()),
                    onPressed: () {
                      Get.to(()=>OwnerScreen());
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(services.toUpperCase()),
                    onPressed: () {
                      Get.to(()=>ServiceScreen());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
