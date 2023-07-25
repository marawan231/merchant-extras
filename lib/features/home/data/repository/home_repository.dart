import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../../../deals/data/model/deal_model.dart';
import '../models/slider_model.dart';

class HomeRepository {
  final WebServices webServices;

  HomeRepository(this.webServices);

  Future<ApiResult<List<SliderModel>>> getAllSliders() async {
    try {
      var response = await webServices.getAllSliders();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<List<DealModel>>> getInternationalTopDeals() async {
    try {

      var response = await webServices.getInternationalTopDeals();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<List<DealModel>>> getLocalTopDeals() async {
    try {
      var response = await webServices.getLocalTopDeals();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }


}
