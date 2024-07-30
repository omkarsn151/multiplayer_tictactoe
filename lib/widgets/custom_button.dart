import 'package:flutter/material.dart';
import 'package:multiplayer_tictactoe/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blue,
        //     blurRadius: 5,
        //     spreadRadius: 0,
        //   )
        // ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 10,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: btnColor,
          minimumSize: Size(
            deviceWidth/2,
            deviceHeight/19,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: bgColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

