import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../model/payment.dart';
import '../../../model/users.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://devapi.pepcorns.com/api/test/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;
  @GET('getAllUsers')
  Future<Users?> getAllUsers();

  @GET('getUserById/{id}')
  Future<Users?> getUserWithId(@Path('id') String id);

  @GET('getAllPayments')
  Future<Payment?> getAllPayments();

  @GET('getPayment/{id}')
  Future<Payment?> getPaymentWithId(@Path('id') String id);
}
