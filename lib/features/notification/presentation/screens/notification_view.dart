import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant_extras/core/resources/assets_manager.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import '../../business_logic/cubit/notification_cubit.dart';
import '../../business_logic/cubit/notification_state.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/notification_item.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late final NotificationCubit notificationCubit;

  _buildBloc() {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildView(),
          success: (data) {
            return _buildView();
          },
          error: (networkExceptions) {
            return ErrorScreen(
                message: DioExceptionType.getErrorMessage(networkExceptions));
          },
          loading: () {
            return const LoadingIndicator();
          },
        );
      },
    );
  }

  _buildView() {
    return notificationCubit.notifications.isEmpty
        ? const EmptyScreen(
            message: AppStrings.notificationEmptyMessage,
            image: ImageAssets.noNotification,
          )
        : Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationItem(
                      model: notificationCubit.notifications[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15.h);
                },
                itemCount: notificationCubit.notifications.length),
          );
  }

  @override
  void initState() {
    notificationCubit = BlocProvider.of<NotificationCubit>(context);

    super.initState();
    // BlocProvider.of<NotificationCubit>(context).getAllNotifications();
  }

  @override
  void didChangeDependencies() {
    // notificationCubit = BlocProvider.of<NotificationCubit>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
