import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/bikeRental.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/electrician.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/groceries.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/homeFood.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/laundry.dart';
import 'package:bachelorapp/src/features/screens/services_screen/Services/plumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(services),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Homefood());
                    },
                    child: Text(HomeFood.toUpperCase())
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Bikerental());
                    },
                    child: Text(BikeRental.toUpperCase())
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Laundry());
                    },
                    child: Text(laundry.toUpperCase())
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Groceries());
                    },
                    child: Text(groceries.toUpperCase())
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Plumber());
                    },
                    child: Text(plumber.toUpperCase())
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>Electrician());
                    },
                    child: Text(electrician.toUpperCase())
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
