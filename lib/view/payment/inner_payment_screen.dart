import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/payment/payment_cubit.dart';
import '../../controller/payment/payment_state.dart';
import '../../core/api/network_exception.dart';

class InnerPaymentScreen extends StatefulWidget {
  const InnerPaymentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<InnerPaymentScreen> createState() => _InnerPaymentScreenState();
}

class _InnerPaymentScreenState extends State<InnerPaymentScreen> {
  @override
  void initState() {
    context.read<PaymentCubit>().getPaymentWithID(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment With Id ${widget.id}'),
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (data) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: data.response?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(data.response![index].age.toString()),
                  title: Text(data.response![index].name.toString()),
                  subtitle: Text(
                    data.response![index].payId.toString(),
                  ),
                );
              },
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
