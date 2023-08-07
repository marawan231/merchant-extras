import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_extras/core/resources/color_manager.dart';
import 'package:merchant_extras/core/resources/commons.dart';
import 'package:merchant_extras/core/resources/shared_prefrences.dart';
import 'package:merchant_extras/core/resources/strings_manager.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../../core/business_logic/cubit/global_state.dart';
import '../../../profile/business_logic/cubit/profile_cubit.dart';
import '../../../profile/business_logic/cubit/profile_state.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView>
    with WidgetsBindingObserver {
  int notificationCount = 0;
  late GlobalCubit globalCubit;

  _buildBloc() {
    return MultiBlocListener(listeners: [
      BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            getUserInfoSuccess: (user) {
              setState(() {
                userImage = user.imageUrl ?? userImage;
                userPhone = user.phone ?? '';
              });
            },
          );
        },
      ),
      BlocListener<GlobalCubit, GlobalState>(
        listener: (context, state) {
          state.whenOrNull(
            logOutSuccess: () {
              CacheHelper.removeAll();

              token = null;
              screenIndex = 0;
              BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(0);
              Commons.showToast(
                message: AppStrings.logOutMessage,
                color: ColorManager.green,
              );
              Navigator.pushReplacementNamed(context, Routes.splashRoute);
            },
            selectedIndexChanged: (index) {
              // setState(() {
              //   selectedTab = index;
              // });
              setState(() {});
            },
            backAfterBack: (index) {
              // setState(() {
              //   selectedTab = index;
              // });
            },
            getUnReadNotificationCount: (count) {
              setState(() => notificationCount = count);
            },
          );
        },
      ),
    ], child: _buildScaffold(context));
  }

  _buildScaffold(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedTab,
        notificationCount: notificationCount,
        onTap: (index) {
          BlocProvider.of<GlobalCubit>(context).changeSelectedIndex(index);
        },
      ),
      appBar:
          screenIndex == 4 || screenIndex == 3 ? null : defaultAppBar(context),
      body: _buildMainHomeViewBody(context),
    );
  }

  _buildMainHomeViewBody(context) {
    return RouteGenerator.screens[screenIndex];
  }

  @override
  void initState() {
    super.initState();
    globalCubit = BlocProvider.of<GlobalCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      globalCubit.startNotificationsStream();
    } else if (state == AppLifecycleState.inactive) {
      globalCubit
          .stopNotificationsStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.paused) {
      globalCubit
          .stopNotificationsStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.inactive) {
      globalCubit
          .stopNotificationsStream(); // this is called when the app is in background
    }
  }
}
