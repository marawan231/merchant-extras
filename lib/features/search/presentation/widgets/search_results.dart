import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/cubit/search_cubit.dart';
import '../../../../core/resources/strings_manager.dart';
import 'search_result_item.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  late final SearchCubit _searchCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  _buildTitle(BuildContext context) {
    return Text(
      AppStrings.searchResults,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  _buildSearchResults() {
    return Expanded(
      child: ListView.separated(
        // shrinkWrap: true,
        itemCount: _searchCubit.deals.length,
        itemBuilder: (context, index) {
          return  SearchResultItem(
            index: index,
            
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 20.h),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }
}
