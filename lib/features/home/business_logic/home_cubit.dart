import 'package:bloc/bloc.dart';

import '../../../core/web_services/network_exceptions.dart';
import '../../deals/data/model/deal_model.dart';
import '../data/models/slider_model.dart';
import '../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(const Idle());

  final HomeRepository homeRepository;
  List<SliderModel>? sliders;

  List<DealModel>? localDeals;
  List<DealModel> internationalDeals = [];
  int defaultChoiceIndex = 0;
  int defaultOrderCategories = 0;
  bool showTitle = true;

  void goToBuyerHome() {
    emit(const HomeState.successBuyerHome());
  }

  void goToSellerHome() {
    emit(const HomeState.successSellerHome());
  }

  void showSelectedView() {
    if (defaultChoiceIndex == 0) {
      goToSellerHome();
    }

    if (defaultChoiceIndex == 1) {
      showTitle = false;
      goToBuyerHome();
    }
  }

  void getAllSliders() async {
    emit(const HomeState.homeSlidersLoading());
    var result = await homeRepository.getAllSliders();
    result.when(
      success: (List<SliderModel> slidesrs) {
        // sliders = sliders;
        sliders = slidesrs;
        emit(HomeState.homeSlidersSuccess(sliders!));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(HomeState.error(networkExceptions));
      },
    );
  }

  void getInternationalTopDeals() async {
    emit(const HomeState.homeTopInternationalDealsLoading());

    var result = await homeRepository.getInternationalTopDeals();
    result.when(
      success: (List<DealModel> deals) {
        internationalDeals = deals;
        emit(HomeState.homeTopInternationalDealsSuccess(deals));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(HomeState.homeTopInternationalDealsError(networkExceptions));
      },
    );
  }

  void getLocalTopDeals() async {
    emit(const HomeState.homeTopLocalDealsLoading());

    var result = await homeRepository.getLocalTopDeals();
    result.when(
      success: (List<DealModel> deals) {
        localDeals = deals;
        emit(HomeState.homeTopLocalDealsSuccess(deals));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(HomeState.homeTopLocalDealsError(networkExceptions));
      },
    );
  }
}
