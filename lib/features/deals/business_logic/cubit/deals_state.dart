import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/deal_model.dart';
import '../../data/model/deal_response.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../../search/data/models/category_model.dart';
import '../../../search/data/models/products_model.dart';

part 'deals_state.freezed.dart';

@freezed
class DealsState<T> with _$DealsState<T> {
  const factory DealsState.idle() = Idle<T>;

  const factory DealsState.myInfoViewSelected() = MyInfoViewSelected<T>;

  const factory DealsState.myOffersViewSelected() = MyOffersViewSelected<T>;

  const factory DealsState.myOngoingNegotiationSelected() =
      MyOngoingNegotiationSelected<T>;

  const factory DealsState.allViewSelected() = AllViewSelected<T>;

  const factory DealsState.shipPrepareViewSelected() =
      ShipPrepareViewSelected<T>;

  const factory DealsState.shippmentOnGoingViewSelected() =
      ShippmentOnGoingViewSelected<T>;

  const factory DealsState.onTheWayViewSelected() = OnTheWayViewSelected<T>;

  const factory DealsState.worldDealSelected() = WorldDealSelected<T>;

  const factory DealsState.localDealSelected() = LocalDealSelected<T>;

  const factory DealsState.freshPatternSelected() = FreshPatternSelected<T>;

  const factory DealsState.dryPatternSelected() = DryPatternSelected<T>;

  const factory DealsState.frozenPatternSelected() = FrozenPatternSelected<T>;

  const factory DealsState.cookedPatternSelected() = CookedPatternSelected<T>;

  const factory DealsState.seedsPatternSelected() = SeedsPatternSelected<T>;

  const factory DealsState.worldSearchView() = WorldView<T>;

  const factory DealsState.localSearchView() = LocalView<T>;

  const factory DealsState.tamweelSearchView() = TamweelView<T>;

  const factory DealsState.farmProducts() = FarmProducts<T>;

  const factory DealsState.animalProducts() = AnimalProducts<T>;

  const factory DealsState.farmEquipments() = FarmEquipments<T>;

  const factory DealsState.animalEquipments() = AnimalEquipments<T>;

  // const factory DealsState.back() = Back<T>;
  // const factory DealsState.backAfterBack() = BackAfterBack<T>;

  const factory DealsState.getCatogoriesLoading() = GetCatogoriesLoading<T>;

  const factory DealsState.getCatogoriesSuccedded(
      List<CategoryModel> categories) = GetCatogoriesSuccedded<T>;

  const factory DealsState.getCatogoriesError(
      DioExceptionType networkExceptions) = GetCatogoriesError<T>;

  const factory DealsState.getProductsLoading() = GetProductsLoading<T>;

  const factory DealsState.getProductsSuccedded(
      List<ProductsModel> categories) = GetProductsSuccedded<T>;

  const factory DealsState.getProductsError(
      DioExceptionType networkExceptions) = GetProductsError<T>;

  const factory DealsState.getDealsLoading() = GetDealsLoading<T>;

  const factory DealsState.getDealsSuccedded(List<DealModel> items) =
      GetDealsSuccedded<T>;

  const factory DealsState.getDealsError(DioExceptionType networkExceptions) =
      GetDealsError<T>;

  const factory DealsState.getDealsDetailsLoading() = GetDealsDetailsLoading<T>;

  const factory DealsState.getDealsDetailsSuccedded(DealResponse items) =
      GetDealsDetailsSuccedded<T>;

  const factory DealsState.getDealsDetailsError(
      DioExceptionType networkExceptions) = GetDealsDetailsError<T>;

  //change category
  const factory DealsState.changeCategoryLoading() = ChangeCategoryLoading<T>;

  const factory DealsState.changeCategorySuccedded(String name) =
      ChangeCategorySuccedded<T>;
}
