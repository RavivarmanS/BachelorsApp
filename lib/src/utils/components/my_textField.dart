import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscucreText;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscucreText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            fillColor: Colors.black12,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color:Color.fromARGB(255, 0, 0, 150))),
      ),
    );
  }
}