import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/user_entity.dart';
import 'package:randomuserflutter/features/random_users/presentation/cubit/random_user_cubit.dart';

class RandomUsersPage extends StatefulWidget {
  const RandomUsersPage({super.key});

  @override
  State<RandomUsersPage> createState() => _RandomUsersPageState();
}

class _RandomUsersPageState extends State<RandomUsersPage> {
  List<UserEntity> users = <UserEntity>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => BlocProvider.of<RandomUserCubit>(context).getAllUsers(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RandomUserCubit, RandomUserState>(
      listener: (BuildContext context, RandomUserState state) {
        if (state is RandomUserError) {
          debugPrint('error in main');
        }
        if (state is RandomUserLoaded) {
          users.addAll(state.users);
        }
      },
      child: BlocBuilder<RandomUserCubit, RandomUserState>(
        builder: (BuildContext context, RandomUserState state) {
          if (state is RandomUserLoading && users.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RandomUserLoaded) {
            return Scaffold(
              body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].email!),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
