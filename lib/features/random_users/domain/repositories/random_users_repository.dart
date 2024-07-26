import 'package:randomuserflutter/features/random_users/domain/entities/api_results_entity.dart';

abstract class RandomUsersRepository {
  Future<ApiResultsEntity?> getAllUsers();
}
