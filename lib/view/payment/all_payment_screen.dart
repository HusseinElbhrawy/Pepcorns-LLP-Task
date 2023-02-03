// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_routes.dart';
import '../../controller/payment/payment_cubit.dart';
import '../../controller/payment/payment_state.dart';
import '../../core/api/network_exception.dart';
import '../../core/widgets/table_widget.dart';
import '../../model/payment.dart';

class AllPaymentScreen extends StatefulWidget {
  const AllPaymentScreen({Key? key}) : super(key: key);

  @override
  State<AllPaymentScreen> createState() => _AllPaymentScreenState();
}

class _AllPaymentScreenState extends State<AllPaymentScreen> {
  @override
  void initState() {
    context.read<PaymentCubit>().getAllPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Payments'),
      ),
      body: BlocBuilder<PaymentCubit, PaymentState<Payment?>>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (data) => RefreshIndicator(
              onRefresh: () async {
                context.read<PaymentCubit>().getAllPayment();
              },
              child: PaymentLoadedWidget(payment: data!),
            ),
            error: (networkExceptions) => Center(
              child: Text(
                NetworkExceptions.getErrorMessage(networkExceptions),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentLoadedWidget extends StatefulWidget {
  const PaymentLoadedWidget({
    Key? key,
    required this.payment,
  }) : super(key: key);
  final Payment payment;

  @override
  State<PaymentLoadedWidget> createState() => _PaymentLoadedWidgetState();
}

class _PaymentLoadedWidgetState extends State<PaymentLoadedWidget> {
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    return TableWidget(
      sortAscending: isAscending,
      sortIndex: 3,
      columns: [
        const DataColumn(
          label: Text('User ID'),
        ),
        const DataColumn(
          label: Text('Name'),
        ),
        const DataColumn(
          label: Text('Pay ID'),
        ),
        DataColumn(
          label: const Text('Status'),
          onSort: (columnIndex, ascending) {
            widget.payment.response!.sort(
              (payment1, payment2) {
                return isAscending
                    ? payment1.status!.compareTo(payment2.status!)
                    : payment2.status!.compareTo(payment1.status!);
              },
            );
            isAscending = !isAscending;

            setState(() {});
          },
        ),
      ],
      rows: List.generate(
        widget.payment.response?.length ?? 0,
        (index) {
          return DataRow(
            cells: [
              DataCell(
                Text(widget.payment.response![index].userId.toString()),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.innerPaymentRoute,
                    arguments: widget.payment.response![index].payId,
                  );
                },
              ),
              DataCell(
                Text(widget.payment.response![index].name.toString()),
              ),
              DataCell(
                Text(widget.payment.response![index].payId
                    .toString()
                    .toUpperCase()),
              ),
              DataCell(
                Text(widget.payment.response![index].status
                    .toString()
                    .toUpperCase()),
              ),
            ],
          );
        },
      ),
    );
  }
}
