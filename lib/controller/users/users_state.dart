import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/api/network_exception.dart';
import '../../model/users.dart';

part 'users_state.freezed.dart';

@Freezed()
class UserState<T> with _$UserState<T> {
  const factory UserState.loading() = Loading<T>;

  const factory UserState.success(Users data) = Success<T>;

  const factory UserState.error(NetworkExceptions networkExceptions) = Error<T>;
}
