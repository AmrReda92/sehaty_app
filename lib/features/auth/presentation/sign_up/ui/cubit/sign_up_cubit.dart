import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehaty_application/features/auth/data/models/user_model.dart';
import 'package:sehaty_application/features/auth/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  createUserWithEmailAndPassword({required UserModel userModel}) async{
    emit(SignUpLoading());

    try{
      final user = await AuthRepo.createUserWithEmailAndPassword(model: userModel);
      emit(SignUpSuccess(user));
    }catch(e){
      emit(SignUpError(e.toString()));

    }
  }
}
