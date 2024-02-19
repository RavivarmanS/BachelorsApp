import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/features/screens/owner_screen/owner.dart';
import 'package:bachelorapp/src/features/screens/tenent_screen/tenent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
