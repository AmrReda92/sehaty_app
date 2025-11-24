
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:sehaty_application/features/auth/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  createUserWithEmailAndPassword({required SignUpModel model})async{
    emit(SignUpLoading());
    try{
      //  firebase  ده المتغيّر اللي بيرجع من credential
      //    بعد ما تعمل السطر ده
      final credential= await AuthRepo.createUserWithEmailAndPassword(model: model);

      emit(SignUpSuccess(uid: credential.user!.uid));
    }
    catch(e){
      emit(SignUpError(e.toString()));
      
    }
  }

}


/*
credential.user يعني إيه
ده ال  user
ال اتسجل في فايرباز
جواه معلومات المستخدم زي

uid
email
displayName
phoneNumber
photoURL
 */