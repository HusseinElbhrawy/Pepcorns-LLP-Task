import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/network_exception.dart';
import '../../model/payment.dart';
import '../../repository/app_repository.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState<Payment?>> {
  final AppRepository repository;
  PaymentCubit({
    required this.repository,
  }) : super(const PaymentState.loading());

  void getAllPayment() async {
    final payment = await repository.getAllPayments();
    payment.when(
      success: (data) {
        return emit(PaymentState.success(data));
      },
      failure: (networkExceptions) {
        log(NetworkExceptions.getErrorMessage(networkExceptions));

        return emit(PaymentState.error(networkExceptions));
      },
    );
  }

  void getPaymentWithID(String id) async {
    final payment = await repository.getPaymentWithId(id);
    payment.when(
      success: (data) {
        return emit(PaymentState.success(data));
      },
      failure: (networkExceptions) {
        log(NetworkExceptions.getErrorMessage(networkExceptions));
        return emit(PaymentState.error(networkExceptions));
      },
    );
  }
}
