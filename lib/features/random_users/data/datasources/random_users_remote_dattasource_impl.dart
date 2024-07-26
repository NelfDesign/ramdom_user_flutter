import 'package:dio/dio.dart';
import 'package:randomuserflutter/core/data/api_services.dart';
import 'package:randomuserflutter/features/random_users/data/datasources/ramdom_users_remote_datasource.dart';
import 'package:randomuserflutter/features/random_users/data/models/api_results.dart';

class RandomUsersRemoteDataSourceImpl implements RandomUserRemoteDataSource {
  @override
  Future<ApiResults> getAllUsers() async {
    final Response decodedJson = await HttpApiClient(dioClient: Dio()).get();
    return ApiResults.fromJson(decodedJson.data);
  }
}
