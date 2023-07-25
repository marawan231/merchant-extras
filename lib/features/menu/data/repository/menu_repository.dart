import 'package:merchant_extras/core/web_services/error_model.dart';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/add_balance.dart';
import '../models/settings_model.dart';
import '../models/wallet_info.dart';

class MenuRepository {
  final WebServices webServices;

  MenuRepository(this.webServices);

//fetch poducts
  Future<ApiResult<WalletInfo>> getWalletInfo() async {
    try {
      var response = await webServices.getWalletInfo();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<AddBalance>> addBalanceToWallet(String amount) async {
    try {
      var response = await webServices.addBalanceToWallet(amount);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
// rate  using id and stars and comment and future deals stars and time stars and experience stars and quality stars and communication stars and professional stars

  Future<ApiResult<ErrorModel>> rate(
      String dealId,
      String profissionalStars,
      String communicationStars,
      String qualityStars,
      String experienceStars,

      String comment) async {
    try {
      var response = await webServices.rateDeal(
          dealId,
          profissionalStars,
          communicationStars,
          qualityStars,
          experienceStars,
     
          comment);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
  //get app settings

  Future<ApiResult<List<SettingsModel>>> getAllSettings() async {
    try {
      var response = await webServices.getAllSettings();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
//send complain by phone and notes

  Future<ApiResult<ErrorModel>> sendComplain(
      String phone, String notes) async {
    try {
      var response = await webServices.sendComplain(phone, notes);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
