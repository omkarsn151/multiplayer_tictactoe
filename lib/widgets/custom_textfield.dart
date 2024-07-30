import 'package:flutter/material.dart';


import '../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: bgColor,
        filled: true,
        hintText: hintText,

      ),
    );
  }
}


// decoration: const BoxDecoration(
//   boxShadow: [
//     BoxShadow(
//       color: Colors.black,
//       blurRadius: 5,
//       spreadRadius: 2,
//     )
//   ],
// ),