import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuserflutter/features/random_users/presentation/cubit/random_user_cubit.dart';
import 'package:randomuserflutter/features/random_users/presentation/pages/random_user_page.dart';
import 'package:randomuserflutter/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Dependency Injection
  await init();

  final MultiBlocProvider multiBlocProviders = MultiBlocProvider(
    providers: <BlocProvider<dynamic>>[
      BlocProvider<RandomUserCubit>(
        create: (BuildContext context) => RandomUserCubit(getAll: sl()),
      ),
    ],
    child: Builder(
      builder: (BuildContext context) {
        return const MyApp();
      },
    ),
  );

  runApp(multiBlocProviders);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Random Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RandomUsersPage(),
    );
  }
}
