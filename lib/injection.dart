import 'package:get_it/get_it.dart';
import 'package:randomuserflutter/features/random_users/data/datasources/ramdom_users_remote_datasource.dart';
import 'package:randomuserflutter/features/random_users/data/datasources/random_users_remote_dattasource_impl.dart';
import 'package:randomuserflutter/features/random_users/data/repositories/random_users_repository_impl.dart';
import 'package:randomuserflutter/features/random_users/domain/repositories/random_users_repository.dart';
import 'package:randomuserflutter/features/random_users/domain/usecases/get_all_users.dart';

/// [CODEGEN IMPORTS]

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<RandomUserRemoteDataSource>(
    () => RandomUsersRemoteDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<RandomUsersRepository>(
    () => RandomUsersRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllUsers(sl()));
}
