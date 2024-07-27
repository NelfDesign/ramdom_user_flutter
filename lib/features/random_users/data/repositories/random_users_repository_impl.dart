import 'package:flutter/material.dart';
import 'package:randomuserflutter/features/random_users/data/datasources/ramdom_users_remote_datasource.dart';
import 'package:randomuserflutter/features/random_users/data/models/api_results.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/api_results_entity.dart';
import 'package:randomuserflutter/features/random_users/domain/repositories/random_users_repository.dart';

class RandomUsersRepositoryImpl extends RandomUsersRepository {
  RandomUsersRepositoryImpl({
    required this.remoteDataSource,
  });

  final RandomUserRemoteDataSource remoteDataSource;

  @override
  Future<ApiResultsEntity?> getAllUsers() async {
    try {
      // Call the API
      final ApiResults remoteUsers = await remoteDataSource.getAllUsers();

      return ApiResultsEntity.fromModel(remoteUsers);
    } catch (e) {
      debugPrint('error in repo = $e');
      return null;
    }
  }
}
