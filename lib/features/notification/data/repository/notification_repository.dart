import 'package:merchant_extras/features/notification/data/models/unread_count_notifications_response.dart';

import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  final WebServices webServices;

  NotificationRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<NotifiticationModel>>> getAllNotifications() async {
    try {
      var response = await webServices.getAllNotifications();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }

  Future<ApiResult<UnreadCountResponse>> getUnReadNotificationsCount() async {
    try {
      var response = await webServices.getUnReadNotificationCount();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionType.getDioException(error));
    }
  }
}
