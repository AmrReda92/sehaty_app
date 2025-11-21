import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller ;
  const CustomTextFormField({super.key, required this.hintText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        fillColor: Color(0xffe6eef9),
        filled: true,
        hintText: hintText ,
      ),
    );
  }
}
