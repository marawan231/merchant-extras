import 'dart:developer';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/auth_model.dart';
import '../models/countries_currencies.dart';

class AuthRepoistry {
  final WebServices webServices;

  AuthRepoistry(this.webServices);

//register
  Future<ApiResult<AuthModel>> registerNewUser(
    String? token,
    String? name,
    String? countryId,
    String? currencyId,
    String? email,
    String? phone,
    String? imageUrl,
    String? referrerKey,
  ) async {
    try {
      var response = await webServices.register(token, name, countryId,
          currencyId, email, phone, imageUrl, referrerKey);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

//Login
  Future<ApiResult<AuthModel>> login(String uid) async {
    try {
      var response = await webServices.login(uid);
      return ApiResult.success(response);
    } catch (error) {
      log('error in getAllCountriesCurrencies $error');

      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<List<CountriesCurrencies>>>
      getAllCountriesCurrencies() async {
    try {
      var response = await webServices.getAllCountriesCurrencies();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
