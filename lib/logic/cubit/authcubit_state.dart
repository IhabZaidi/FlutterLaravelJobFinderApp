part of 'authcubit_cubit.dart';

@immutable
abstract class AuthcubitState {}

class AuthcubitInitial extends AuthcubitState {}
class AuthcubitWaiting extends AuthcubitState {}
class AuthcubitLoged extends AuthcubitState {
}
class AuthcubitLogout extends AuthcubitState {}
class AuthcubitFailed extends AuthcubitState {}
