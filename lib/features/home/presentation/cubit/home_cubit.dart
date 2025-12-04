import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehaty_application/features/auth/data/models/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadDataUser (UserModel userDataLoaded){
    emit(HomeDataSuccess(userDataLoaded));
  }


}
