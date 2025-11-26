
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sehaty_application/features/auth/data/models/sign_in_model.dart';
import 'package:sehaty_application/features/auth/data/models/sign_up_model.dart';

class AuthRepo {

  static Future<UserCredential> createUserWithEmailAndPassword({required SignUpModel model}) async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      await FirebaseFirestore.instance.
      collection("users").doc(credential.user!.uid).set(model.toJson());

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

  static Future<UserCredential> signInWithEmailAndPassword({required SignInModel model})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }else{
        throw Exception('Auth error: ${e.message}');
      }
     }catch(e){
      throw Exception("Unknown error: $e");

    }
    }


}





