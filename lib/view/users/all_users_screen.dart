// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pepcorns_llp/core/api/network_exception.dart';

import '../../app/app_routes.dart';
import '../../controller/users/users_cubit.dart';
import '../../controller/users/users_state.dart';
import '../../core/widgets/table_widget.dart';
import '../../model/users.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UsersCubit, UserState<Users>>(
        builder: (context, state) {
          return state.whenOrNull(
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<UsersCubit>().getAllUsers();
                },
                child: UsersLoadedWidget(users: data),
              );
            },
            error: (networkExceptions) => Center(
              child: Text(
                NetworkExceptions.getErrorMessage(networkExceptions),
              ),
            ),
          )!;
        },
      ),
    );
  }
}

class UsersLoadedWidget extends StatefulWidget {
  const UsersLoadedWidget({
    Key? key,
    required this.users,
  }) : super(key: key);
  final Users users;

  @override
  State<UsersLoadedWidget> createState() => _UsersLoadedWidgetState();
}

class _UsersLoadedWidgetState extends State<UsersLoadedWidget> {
  bool isAscending = true;
  @override
  Widget build(BuildContext context) {
    return TableWidget(
      sortAscending: isAscending,
      sortIndex: 2,
      columns: [
        const DataColumn(
          label: Text('User ID'),
        ),
        const DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: const Text('Age'),
          onSort: (columnIndex, ascending) {
            widget.users.response!.sort(
              (user1, user2) {
                return isAscending
                    ? user1.age!.compareTo(user2.age!)
                    : user2.age!.compareTo(user1.age!);
              },
            );
            isAscending = !isAscending;

            setState(() {});
          },
        ),
      ],
      rows: List.generate(
        widget.users.response?.length ?? 0,
        (index) {
          return DataRow(
            cells: [
              DataCell(
                Text(widget.users.response![index].userId.toString()),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.innerUserRoute,
                    arguments: widget.users.response![index].userId,
                  );
                },
              ),
              DataCell(
                Text(widget.users.response![index].name.toString()),
              ),
              DataCell(
                Text(
                    widget.users.response![index].age.toString().toUpperCase()),
              ),
            ],
          );
        },
      ),
    );
  }
}
