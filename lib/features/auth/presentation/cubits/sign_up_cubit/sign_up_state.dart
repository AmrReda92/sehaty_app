part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}
final class SignUpError extends SignUpState {
  final String error;
  SignUpError(this.error);
}
final class SignUpSuccess extends SignUpState {
  final String uid;
  SignUpSuccess({required this.uid});
}
