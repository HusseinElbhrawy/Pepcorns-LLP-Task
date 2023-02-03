import '../core/api/api_result.dart';
import '../core/api/network_exception.dart';
import '../core/api/web_services.dart';
import '../model/payment.dart';
import '../model/users.dart';

class AppRepository {
  final WebServices webServices;

  AppRepository(this.webServices);

  Future<ApiResult<Users?>> getAllUsers() async {
    try {
      final response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<Users?>> getUserWithId(String id) async {
    try {
      final response = await webServices.getUserWithId(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<Payment?>> getAllPayments() async {
    try {
      final response = await webServices.getAllPayments();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<Payment?>> getPaymentWithId(String id) async {
    try {
      final response = await webServices.getPaymentWithId(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
