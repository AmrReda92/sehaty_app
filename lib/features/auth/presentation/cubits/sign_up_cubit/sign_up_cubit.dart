
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehaty_application/features/auth/data/models/sign_up_model.dart';
import 'package:sehaty_application/features/auth/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

 final AuthRepo _authRepo = AuthRepo();
  signUp({required SignUpModel model})async{
    emit(SignUpLoading());
    // requset success بتشتغل لما ال then
  await  _authRepo.signUp(model: model).then((value){
    emit(SignUpSuccess(uid: value.user!.uid));
  }).catchError((error){
   emit(SignUpError());
   debugPrint (error.toString());
  }) ;
  }


}
