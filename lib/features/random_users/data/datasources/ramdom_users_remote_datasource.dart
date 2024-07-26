import 'package:randomuserflutter/features/random_users/data/models/api_results.dart';

abstract class RandomUserRemoteDataSource {
  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ApiResults> getAllUsers();
}
