import '../model/deal_model.dart';
import '../model/deal_response.dart';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../../../search/data/models/category_model.dart';
import '../../../search/data/models/products_model.dart';

class DealsRepository {
  final WebServices webServices;

  DealsRepository(this.webServices);

  Future<ApiResult<List<CategoryModel>>> getAllCategories(
      {required String type}) async {
    try {
      var response = await webServices.getAllCategories(type: type);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<List<ProductsModel>>> getAllProducts() async {
    try {
      var response = await webServices.getAllProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<List<DealModel>>> getDeals() async {
    try {
      var response = await webServices.getDeals();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<DealResponse>> getDealDetails(int id) async {
    try {
      var response = await webServices.getDealsDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
