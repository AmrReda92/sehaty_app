
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sehaty_application/features/auth/data/models/sign_up_model.dart';

class AuthRepo {

 Future<UserCredential> createUserWithEmailAndPassword({required SignUpModel model}) async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      await credential.user!.updateDisplayName(model.name) ;

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      else {
        throw Exception('Auth error: ${e.message}');
      }
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }

}





/*
   // class  تقدر تستعملها في أي دالة جوه الـ  FirebaseAut  نسخة جاهزة من

  static FirebaseAuth instance = FirebaseAuth.instance ;

  // اللي فيها معلومات المستخدم بعد التسجيل UserCredential  ترجع لك

  Future<UserCredential> signUp ({required SignUpModel model})async{
  return  instance.createUserWithEmailAndPassword(email: model.email, password: model.password);

  }
 */
