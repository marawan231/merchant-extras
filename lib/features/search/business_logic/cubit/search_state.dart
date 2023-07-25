import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../../deals/data/model/deal_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/products_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState<T> {
  const factory SearchState.idle() = Idle<T>;

  const factory SearchState.selectedSearchCategoryResultView() =
      SelectedSearchCategoryResultView<T>;

  const factory SearchState.searchCategoriesView() = SearchCategoriesView<T>;

  const factory SearchState.freshPatternSelected() = FreshPatternSelected<T>;

  const factory SearchState.dryPatternSelected() = DryPatternSelected<T>;

  const factory SearchState.frozenPatternSelected() = FrozenPatternSelected<T>;

  const factory SearchState.worldSearchView() = WorldSearchView<T>;

  const factory SearchState.localSearchView() = LocalSearchView<T>;

  const factory SearchState.tamweelSearchView() = TamweelSearchView<T>;

  const factory SearchState.farmProducts() = FarmProducts<T>;

  const factory SearchState.animalProducts() = AnimalProducts<T>;

  const factory SearchState.farmEquipments() = FarmEquipments<T>;

  const factory SearchState.animalEquipments() = AnimalEquipments<T>;

  const factory SearchState.fromCheabestSelected() = FromCheabestSelected<T>;

  const factory SearchState.fromHighestSelected() = FromHighestSelected<T>;

  // const factory SearchState.selectedIndexChanged(int index) = SelectedIndexChanged<T>;
  // const factory SearchState.back() = Back<T>;
  // const factory SearchState.backAfterBack() = BackAfterBack<T>;
  //

  const factory SearchState.getCatogoriesLoading() = GetCatogoriesLoading<T>;

  const factory SearchState.getCatogoriesSuccedded(
      List<CategoryModel> categories) = GetCatogoriesSuccedded<T>;

  const factory SearchState.getCatogoriesError(
      DioExceptionType networkExceptions) = GetCatogoriesError<T>;

  const factory SearchState.getProductsLoading() = GetProductsLoading<T>;

  const factory SearchState.getProductsSuccedded(
      List<ProductsModel> categories) = GetProductsSuccedded<T>;

  const factory SearchState.getProductsError(
      DioExceptionType networkExceptions) = GetProductsError<T>;

  // filter

  const factory SearchState.filterLoading() = FilterLoading<T>;

  const factory SearchState.filterSucceded(List<DealModel> categories) =
      FilterSucceded<T>;

  const factory SearchState.filterError(DioExceptionType networkExceptions) =
      filterError<T>;
      // reset filter

  const factory SearchState.resetFilter() = ResetFilter<T>;
  
}
