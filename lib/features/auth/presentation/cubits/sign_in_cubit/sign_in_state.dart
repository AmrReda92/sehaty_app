part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {
  final String uid ;
  SignInSuccess({required this.uid});
}
final class SignInError extends SignInState {
  final String error;
  SignInError(this.error);

}
