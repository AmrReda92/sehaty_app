import 'package:flutter/material.dart';
import 'package:sehaty_application/core/widgets/custom_elevated_button.dart';
import 'package:sehaty_application/core/widgets/custom_text_form_field.dart';
import 'package:sehaty_application/features/auth/presentation/sign_in/ui/sign_in_screen.dart';
import 'package:sehaty_application/features/home/presentation/ui/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>() ;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


@override
  void dispose() {
    nameController.dispose();
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
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 26,
                children: [
                  SizedBox(height: 16,),
                  Image.asset("assets/images/logo.png",width: 240,height: 240,),
                  Text("Sign Up",style: TextStyle(fontSize: 30,color: Color(0xff0B8FAC)),),
                  CustomTextFormField(hintText: "Name", controller: nameController,),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: emailController ,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value==null || value.isEmpty || !value.contains("@")){
                        return "Email is not correct";
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
                      if(value == null || value.isEmpty || value.length<6){
                        return "Enter a valid password,must be more than 6 char";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8,),
                  CustomElevatedButton(
                    text: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      },
                      child: Text("I Already have an account",style: TextStyle(fontSize: 16),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
