import 'package:bloc/bloc.dart';
import '../../data/models/notification_model.dart';

import '../../data/repository/notification_repository.dart';

import '../../../../core/web_services/network_exceptions.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepository)
      : super(const NotificationState.idle());

  final NotificationRepository notificationRepository;

  List<NotifiticationModel> notifications = [];

  void getAllNotifications() async {
    emit(const NotificationState.loading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await notificationRepository.getAllNotifications();
    result.when(
      success: (List<NotifiticationModel> notificationss) {
        notifications = notificationss;
        emit(NotificationState.success(notifications));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(NotificationState.error(networkExceptions));
      },
    );
  }
}
