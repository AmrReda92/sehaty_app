part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class HomeDataLoading extends HomeState {}
final class HomeDataSuccess extends HomeState {
  final UserModel user;
  HomeDataSuccess(this.user);
}
final class HomeDataError extends HomeState {
  final String message;
  HomeDataError(this.message);
}
