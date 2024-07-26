part of 'random_user_cubit.dart';

abstract class RandomUserState {}

class RandomUserInitial extends RandomUserState {}

class RandomUserLoading extends RandomUserState {}

class RandomUserLoaded extends RandomUserState {
  RandomUserLoaded({required this.users});

  final List<UserEntity> users;
}

class RandomUserError extends RandomUserState {
  RandomUserError({this.errorCode});

  final String? errorCode;
}
