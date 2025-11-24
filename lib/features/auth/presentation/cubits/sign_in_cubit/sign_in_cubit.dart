import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehaty_application/features/auth/data/models/sign_in_model.dart';
import 'package:sehaty_application/features/auth/data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  signInWithEmailAndPassword({required SignInModel model})async{
    emit(SignInLoading());
     try{
    final credential =   await AuthRepo.signInWithEmailAndPassword(model: model);
       emit(SignInSuccess(uid: credential.user!.uid));
     }catch(e){
       emit(SignInError(e.toString()));
     }
    }
  }

