import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/search_state.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../widgets/world_view_item.dart';

class WorldSearchView extends StatefulWidget {
  const WorldSearchView({
    super.key,
  });

  @override
  State<WorldSearchView> createState() => _WorldSearchViewState();
}

class _WorldSearchViewState extends State<WorldSearchView> {
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
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          getCatogoriesLoading: () {
            return const LoadingIndicator();
          },
          getCatogoriesSuccedded: (categories) {
            return _buildView();
          },
          orElse: () {
            return _buildView();
          },
        );
      },
    );
  }

  Widget _buildView() {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return WorldViewItem(
            leading: cubit.categories[index].imageUrl!,
            title: cubit.categories[index].name!,
            index: index,
            id: cubit.categories[index].id!.toString(),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15.h);
        },
        itemCount: cubit.categories.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              // BlocProvider.of<GlobalCubit>(context).backToAfterBack(1);
              Navigator.pop(context);
            }),
        title: Text(BlocProvider.of<SearchCubit>(context).title),
      ),
      body: _buildWorldSearchViewBody(context),
    );
  }
}
