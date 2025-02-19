import 'package:flutter/material.dart';
import 'package:money_mate/constant/constant.dart';

class AuthTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const AuthTextField({
    required this.title,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Gap.h8,
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: title,
              // labelText: "Masukan nama",
            ),
          )
        ],
      ),
    );
  }
}
