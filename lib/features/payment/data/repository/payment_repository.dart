import '../../../../core/web_services/error_model.dart';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';

class PaymentRepository {
  final WebServices webServices;

  PaymentRepository(this.webServices);

  // Future<ApiResult<List<SettingsModel>>> getAllSettings() async {
  //   try {
  //     var response = await webServices.getAllSettings();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(DioExceptionType.getDioException(error));
  //   }
  // }
  //buy quantity
  Future<ApiResult<ErrorModel>> buyQuantity({
    required String dealId,
    required String quantity,
    required String countryId,
  }) async {
    try {
      var response = await webServices.buyQuantity(dealId, quantity, countryId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
  //buy all quantity 
  Future<ApiResult<ErrorModel>> buyAllQuantity({
    required String dealId,
    required String countryId,
  }) async {
    try {
      var response = await webServices.buyAllQuantity(dealId, countryId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }


}
