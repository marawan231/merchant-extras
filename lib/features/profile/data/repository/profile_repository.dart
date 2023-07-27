import 'dart:io';

import '../../../../core/web_services/error_model.dart';
import '../../../auth/data/models/auth_model.dart';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';

class ProfileRepository {
  final WebServices webServices;

  ProfileRepository(this.webServices);

//getUserInfo
  Future<ApiResult<User>> getUserInfo() async {
    try {
      var response = await webServices.getUserInfo();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<ErrorModel>> updateProfile(User user, File? image) async {
    try {
      var response = await webServices.updateProfile(
        phone: user.phone,
        currency: user.currency,
        countryId: user.countryId,
        name: user.name,
        image: image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
