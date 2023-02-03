import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/payment/payment_cubit.dart';
import '../controller/users/users_cubit.dart';
import '../view/layout_screen.dart';
import '../view/payment/all_payment_screen.dart';
import '../view/payment/inner_payment_screen.dart';
import '../view/users/all_users_screen.dart';
import '../view/users/inner_user_screen.dart';
import 'injector.dart';

class Routes {
  static const String layoutRoute = '/';

  static const String allUsersRoute = '/allUsers';
  static const String innerUserRoute = '/innerUser';
  static const String allPaymentRoute = '/allPayment';
  static const String innerPaymentRoute = '/innerPayment';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.allUsersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<UsersCubit>(),
            child: const AllUsersScreen(),
          ),
        );
      case Routes.innerUserRoute:
        String userId = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<UsersCubit>(),
            child: InnerUserScreen(userId: userId),
          ),
        );
      case Routes.allPaymentRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<PaymentCubit>(),
            child: const AllPaymentScreen(),
          ),
        );
      case Routes.innerPaymentRoute:
        String paymentId = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<PaymentCubit>(),
            child: InnerPaymentScreen(id: paymentId),
          ),
        );

      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:
              // ignore: todo
              const Text(
            'No Route Found',
          ),
        ),
        body: const Center(
          child: Text(
            'No Route Found',
          ),
        ),
      ),
    );
  }
}
