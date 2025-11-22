import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText ;
  final TextInputType? keyboardType ;
  final TextEditingController controller ;
  final String? Function(String?)? validator;
  const CustomTextFormField({super.key, required this.hintText,required this.controller, this.validator,  this.obscureText=false, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ,
      obscureText: obscureText ,
      controller: controller ,
      validator: validator ,
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
