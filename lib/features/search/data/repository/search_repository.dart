import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../../../deals/data/model/deal_model.dart';
import '../models/category_model.dart';
import '../models/products_model.dart';

class SearchRepository {
  final WebServices webServices;

  SearchRepository(this.webServices);

  Future<ApiResult<List<CategoryModel>>> getAllCategories() async {
    try {
      var response = await webServices.getAllCategories();
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
  //filter  deals by  geography and category id and product id and currency id and price from and price to and amount and shape and order by

  Future<ApiResult<List<DealModel>>> filterProducts(
       {required String geography,
      String? categoryId,
      String? productId,
      // String? currencyId,
      String? priceFrom,
      String? priceTo,
      String? amount,
      String? shape,
      String? orderBy}) async {
    try {
      var response = await webServices.searchDeals(
        geography,
        categoryId,
        productId,
        // currencyId,
        priceFrom,
        priceTo,
        amount,
        shape,
        orderBy,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
