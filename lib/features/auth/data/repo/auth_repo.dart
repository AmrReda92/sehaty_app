
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sehaty_application/features/auth/data/models/user_model.dart';

class AuthRepo {

  static createUserWithEmailAndPassword({required UserModel model}) async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password.toString(),
      );

      final uid = credential.user!.uid ;
      final UserModel userWithUid = UserModel(
          email: model.email,
          name: model.name,
          uid: uid ,
      );

      // firebase حفظ البيانات الإضافية في
      await FirebaseFirestore.instance.
      collection("users").doc(credential.user!.uid).set(userWithUid.toJson());

      return userWithUid;
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

  static signInWithEmailAndPassword({required UserModel model})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password.toString(),
      );

      final uid = credential.user!.uid ;
      final userDoc = await FirebaseFirestore.instance.collection("users").
      doc(uid).get();
      if(userDoc.exists){
        final Map<String,dynamic> userData = userDoc.data()!;
        return UserModel.fromJson(userData);
      }else{
        throw ("user is not in firebase");
      }

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





