import 'package:flutter/material.dart';
import 'package:sehaty_application/core/widgets/custom_elevated_button.dart';
import 'package:sehaty_application/core/widgets/custom_text_form_field.dart';
import 'package:sehaty_application/features/auth/presentation/sign_up/ui/sign_up_screen.dart';
import 'package:sehaty_application/features/home/presentation/ui/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey ,
            child: SingleChildScrollView(
              child: Column(
                spacing: 26,
                children: [
                  SizedBox(height: 16,),
                  Image.asset("assets/images/logo.png",width: 240,height: 240,),
                  Text("Sign in",style: TextStyle(fontSize: 30,color: Color(0xff0B8FAC)),),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: emailController ,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty || !value.contains("@")){
                        return "Enter a valid Email";
                      }else{
                        return null;
                      }
                    },
                  ),
                  CustomTextFormField(
                    hintText: "password",
                    controller: passwordController ,
                    obscureText: true,
                    validator: (value){
                      if(value==null || value.isEmpty || value.length<6){
                        return "password should more than 6 char";
                      }else{
                        return null;
                      }
                    },

                  ),
                  SizedBox(height: 8,),
                  CustomElevatedButton(
                    text: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill all fields correctly"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: Text("Create an account",style: TextStyle(fontSize: 16),))
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
