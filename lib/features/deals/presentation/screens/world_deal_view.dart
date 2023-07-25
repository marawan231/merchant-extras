import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../business_logic/cubit/deals_cubit.dart';
import '../../business_logic/cubit/deals_state.dart';
import '../widgets/world_deal_view_item.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../search/data/models/category_model.dart';

class WorldDealView extends StatefulWidget {
  const WorldDealView({super.key});

  @override
  State<WorldDealView> createState() => _WorldDealViewState();
}

class _WorldDealViewState extends State<WorldDealView> {
  _buildWorldSearchViewBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 27.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline(context),
          SizedBox(height: 20.h),
          _buildWorldCategories(),
        ],
      ),
    );
  }

  _buildHeadline(BuildContext context) {
    return Text(AppStrings.products,
        style: Theme.of(context).textTheme.headlineSmall);
  }

  _buildWorldCategories() {
    return BlocConsumer<DealsCubit, DealsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          idle: () {
            return const LoadingIndicator();
          },
          getCatogoriesSuccedded: (categories) {
            return _buildView(categories);
          },
          orElse: () {
            return const LoadingIndicator();
          },
        );
      },
    );
  }

  Widget _buildView(List<CategoryModel> worldViewCategories) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return WorldDealViewItem(
            leading: worldViewCategories[index].imageUrl!,
            title: worldViewCategories[index].name!,
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: worldViewCategories.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DealsCubit>(context).getAllCategories(type: 'world');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocConsumer<DealsCubit, DealsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  BlocProvider.of<GlobalCubit>(context).backToAfterBack(3);
                });
          },
        ),
        title: const Text(AppStrings.world),
      ),
      body: _buildWorldSearchViewBody(context),
    );
  }
}
