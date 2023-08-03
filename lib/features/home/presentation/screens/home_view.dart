import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../menu/business_logic/cubit/menu_cubit.dart';

import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../../deals/business_logic/cubit/deals_cubit.dart';
import '../../../notification/business_logic/cubit/notification_cubit.dart';
import '../../../profile/business_logic/cubit/profile_cubit.dart';
import '../../../search/business_logic/cubit/search_cubit.dart';
import '../../business_logic/home_cubit.dart';
import '../widgets/company_features.dart';
import '../widgets/home_categories.dart';
import '../widgets/world_deals.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).getAllCategories();
    BlocProvider.of<SearchCubit>(context).getAllProducts();
    context.read<GlobalCubit>().getAllSettings();
    context.read<GlobalCubit>().getAllCountriesCurrencies();
    BlocProvider.of<DealsCubit>(context).getDeals();
    BlocProvider.of<MenuCubit>(context).getWalletInfo();
    BlocProvider.of<ProfileCubit>(context).getUserInfo();
    BlocProvider.of<SearchCubit>(context).filter();

    // BlocProvider.of<HomeCubit>(context).localDeals != null
    //     ? null
    //     : BlocProvider.of<HomeCubit>(context).getLocalTopDeals();
    BlocProvider.of<HomeCubit>(context).internationalDeals != null
        ? null
        : BlocProvider.of<HomeCubit>(context).getInternationalTopDeals();
    BlocProvider.of<HomeCubit>(context).sliders != null
        ? null
        : BlocProvider.of<HomeCubit>(context).getAllSliders();
    // profileCubit.getUserInfo();

    // globalCubit.startNotificationsStream();

    BlocProvider.of<NotificationCubit>(context).getAllNotifications();
  }

  _buildHomeViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            CompanyFeatures(),
            HomeCategories(),
            WorldDeals(),
            // LocalDeals(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeViewBody(context);
  }
}
