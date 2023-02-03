import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../controller/payment/payment_cubit.dart';
import '../controller/users/users_cubit.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/web_services.dart';
import '../repository/app_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //Bloc
  serviceLocator.registerFactory(
    () => UsersCubit(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => PaymentCubit(
      repository: serviceLocator(),
    ),
  );

  //Repo
  serviceLocator.registerLazySingleton<AppRepository>(
    () => AppRepository(serviceLocator()),
  );

  //!Core
  serviceLocator.registerLazySingleton<WebServices>(
    () => WebServices(serviceLocator()),
  );

  //!External
  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  serviceLocator.registerLazySingleton(() => _dio());
}

Dio _dio() {
  Dio dio = Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  dio.options
    ..baseUrl = 'https://devapi.pepcorns.com/api/test/'
    ..responseType = ResponseType.plain
    ..followRedirects = false
    ..validateStatus = (status) {
      return status! < 500;
    }
    ..sendTimeout = 30 * 1000
    ..receiveTimeout = 30 * 1000;

  dio.interceptors.add(serviceLocator<AppInterceptor>());

  if (kDebugMode) dio.interceptors.add(serviceLocator<LogInterceptor>());

  return dio;
}
