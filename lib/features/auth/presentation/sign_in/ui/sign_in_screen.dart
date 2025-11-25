import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/core/routes/routes.dart';
import 'package:sehaty_application/core/widgets/custom_elevated_button.dart';
import 'package:sehaty_application/core/widgets/custom_show_dialogue.dart';
import 'package:sehaty_application/core/widgets/custom_text_form_field.dart';
import 'package:sehaty_application/features/auth/data/models/sign_in_model.dart';
import 'package:sehaty_application/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';

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
    return BlocConsumer<SignInCubit, SignInState>(
      buildWhen: (previous,current)=>(current is! SignInError),
     listener: (context, state) {

    if(state is SignInLoading){
      CustomshowLoadingDialog(context);

    }else if(state is SignInSuccess){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, Routes.homeScreen);

    }else if(state is SignInError){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
          backgroundColor: Colors.red,
        ),
      );
    }
  },
  builder: (context, state) {
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
                        context.read<SignInCubit>().signInWithEmailAndPassword(
                            model: SignInModel(email: emailController.text, password: passwordController.text)
                        );
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
                        Navigator.pushReplacementNamed(context, Routes.signUpScreen);
                      },
                      child: Text("Create an account",style: TextStyle(fontSize: 16),))
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
