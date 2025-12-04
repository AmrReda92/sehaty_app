import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehaty_application/features/auth/data/models/user_model.dart';
import 'package:sehaty_application/features/auth/data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  signInWithEmailAndPassword({required UserModel userModel})async{
    emit(SignInLoading());

    try{
      final user =await AuthRepo.signInWithEmailAndPassword(model: userModel);
      emit(SignInSuccess(user));
    }catch(e){
      emit(SignInError(e.toString()));
    }
  }
}
