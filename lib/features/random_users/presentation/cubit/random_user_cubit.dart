import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/api_results_entity.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/user_entity.dart';
import 'package:randomuserflutter/features/random_users/domain/usecases/get_all_users.dart';

part 'random_user_state.dart';

class RandomUserCubit extends Cubit<RandomUserState> {
  RandomUserCubit({
    required GetAllUsers getAll,
  })  : _getAllUsers = getAll,
        super(RandomUserInitial());

  final GetAllUsers _getAllUsers;

  Future<void> getAllUsers() async {
    emit(RandomUserLoading());

    final ApiResultsEntity? failureOrEntity = await _getAllUsers.execute();

    if (failureOrEntity != null) {
      emit(RandomUserLoaded(users: failureOrEntity.userEntity));
    } else {
      emit(RandomUserError());
    }
  }
}
