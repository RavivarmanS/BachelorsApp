import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/features/screens/owner_screen/owner_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerScreen extends StatelessWidget {
  const OwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(houseDetails,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>OwnerForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
