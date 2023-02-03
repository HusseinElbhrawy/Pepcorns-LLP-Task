import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/api/network_exception.dart';

part 'payment_state.freezed.dart';

@Freezed()
class PaymentState<T> with _$PaymentState<T> {
  const factory PaymentState.loading() = Loading<T>;

  const factory PaymentState.success(T data) = Success<T>;

  const factory PaymentState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
