import 'package:randomuserflutter/features/random_users/data/models/api_results.dart';
import 'package:randomuserflutter/features/random_users/data/models/user.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/user_entity.dart';

class ApiResultsEntity {
  const ApiResultsEntity({
    required this.userEntity,
  });

  factory ApiResultsEntity.fromModel(ApiResults model) => ApiResultsEntity(
        userEntity: model.results.map((User e) => UserEntity.fromModel(e)).toList(),
      );

  final List<UserEntity> userEntity;
}
