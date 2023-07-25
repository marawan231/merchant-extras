import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/web_services/network_exceptions.dart';
import '../../deals/data/model/deal_model.dart';
import '../data/models/slider_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;

  const factory HomeState.loading() = Loading<T>;

  const factory HomeState.error(DioExceptionType networkExceptions) = Error<T>;

  const factory HomeState.loadingSellerHome() = LoadingSellerHome<T>;

  const factory HomeState.successSellerHome() = SuccessSellerHome<T>;

  const factory HomeState.errorSellerHome() = ErrorSellerHome<T>;

  const factory HomeState.loadingBuyerHome() = LoadingBuyerHome<T>;

  const factory HomeState.successBuyerHome() = SuccessBuyerHome<T>;

  const factory HomeState.errorBuyerHome() = ErrorBuyerHome<T>;

  const factory HomeState.homeSlidersLoading() = HomeSlidersLoading<T>;

  const factory HomeState.homeSlidersSuccess(List<SliderModel> sliders) =
      HomeSlidersSuccess<T>;

  const factory HomeState.homeSlidersError(DioExceptionType networkExceptions) =
      HomeSlidersError<T>;

  const factory HomeState.homeTopInternationalDealsLoading() =
      HomeTopInternationalDealsLoading<T>;

  const factory HomeState.homeTopInternationalDealsSuccess(
          List<DealModel> topInternationalDeals) =
      HomeTopInternationalDealsSuccess<T>;

  const factory HomeState.homeTopInternationalDealsError(
      DioExceptionType networkExceptions) = HomeTopInternationalDealsError<T>;

  const factory HomeState.homeTopLocalDealsLoading() =
      HomeTopLocalDealsLoading<T>;

  const factory HomeState.homeTopLocalDealsSuccess(
      List<DealModel> topLocalDeals) = HomeTopLocalDealsSuccess<T>;

  const factory HomeState.homeTopLocalDealsError(
      DioExceptionType networkExceptions) = HomeTopLocalDealsError<T>;

}
