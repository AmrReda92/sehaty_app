import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget text ;
  final void Function()? onPressed ;

  const CustomElevatedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff0B8FAC),
            padding: EdgeInsets.symmetric(vertical: 12),
            minimumSize: Size(double.infinity,0)
        ),
        onPressed: (){
          onPressed;
        },
        child: text
    );
  }
}
