import 'package:randomuserflutter/features/random_users/domain/entities/api_results_entity.dart';
import 'package:randomuserflutter/features/random_users/domain/repositories/random_users_repository.dart';

class GetAllUsers {
  GetAllUsers(this.repository);

  final RandomUsersRepository repository;

  Future<ApiResultsEntity?> execute() async {
    return repository.getAllUsers();
  }
}
