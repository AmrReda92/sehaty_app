
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sehaty_application/features/auth/data/models/sign_up_model.dart';

// المكان اللي بتحط فيه كل دوال التسجيل – تسجيل الدخول – تسجيل الخروج…

class AuthRepo {

   // class  تقدر تستعملها في أي دالة جوه الـ  FirebaseAut  نسخة جاهزة من

  static FirebaseAuth instance = FirebaseAuth.instance ;

  // اللي فيها معلومات المستخدم بعد التسجيل UserCredential  ترجع لك

  Future<UserCredential> signUp ({required SignUpModel model})async{
  return  instance.createUserWithEmailAndPassword(email: model.email, password: model.password);


        
  }
}