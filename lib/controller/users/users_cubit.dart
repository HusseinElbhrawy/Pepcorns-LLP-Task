import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/network_exception.dart';
import '../../model/users.dart';
import '../../repository/app_repository.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UserState<Users>> {
  final AppRepository repository;
  UsersCubit({
    required this.repository,
  }) : super(const UserState.loading());

  void getAllUsers() async {
    final users = await repository.getAllUsers();

    users.when(
      success: (data) {
        return emit(UserState.success(data!));
      },
      failure: (networkExceptions) {
        log(NetworkExceptions.getErrorMessage(networkExceptions));

        return emit(UserState.error(networkExceptions));
      },
    );
  }

  void getUserWithId(String id) async {
    final users = await repository.getUserWithId(id);
    users.when(
      success: (data) {
        return emit(UserState.success(data!));
      },
      failure: (networkExceptions) {
        log(NetworkExceptions.getErrorMessage(networkExceptions));

        return emit(UserState.error(networkExceptions));
      },
    );
  }
}
