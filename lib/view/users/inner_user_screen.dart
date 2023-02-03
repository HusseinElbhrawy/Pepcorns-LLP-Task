import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/users/users_cubit.dart';
import '../../controller/users/users_state.dart';
import '../../core/api/network_exception.dart';

class InnerUserScreen extends StatefulWidget {
  const InnerUserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  State<InnerUserScreen> createState() => _InnerUserScreenState();
}

class _InnerUserScreenState extends State<InnerUserScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getUserWithId(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User with Id ${widget.userId}'),
      ),
      body: BlocBuilder<UsersCubit, UserState>(
        builder: (context, state) {
          return state.whenOrNull(
            loading: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            success: (data) {
              return ListView.builder(
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
              );
            },
            error: (networkExceptions) {
              return Center(
                child: Text(
                  NetworkExceptions.getErrorMessage(networkExceptions),
                ),
              );
            },
          )!;
        },
      ),
    );
  }
}
