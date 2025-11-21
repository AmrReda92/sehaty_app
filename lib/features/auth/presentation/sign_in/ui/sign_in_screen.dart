import 'package:flutter/material.dart';
import 'package:sehaty_application/core/widgets/custom_elevated_button.dart';
import 'package:sehaty_application/core/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 26,
            children: [
              SizedBox(height: 16,),
              Image.asset("assets/images/logo.png",width: 240,height: 240,),
              Text("Sign in",style: TextStyle(fontSize: 30,color: Color(0xff0B8FAC)),),
              CustomTextFormField(hintText: "Email",controller: emailController ,),
              CustomTextFormField(hintText: "password",controller: passwordController ,),
              SizedBox(height: 8,),
              CustomElevatedButton(
                text: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
