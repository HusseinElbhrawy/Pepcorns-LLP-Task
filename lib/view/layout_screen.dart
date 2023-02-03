import 'package:flutter/material.dart';

import '../app/app_routes.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.allUsersRoute);
              },
              child: const Text('Users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.allPaymentRoute);
              },
              child: const Text('Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
