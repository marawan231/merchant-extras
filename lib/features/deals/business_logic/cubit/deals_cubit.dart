
import 'package:bloc/bloc.dart';
import '../../data/model/deal_model.dart';
import '../../data/model/deal_response.dart';
import '../../data/repository/deals_repository.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../search/data/models/category_model.dart';
import '../../../search/data/models/products_model.dart';
import 'deals_state.dart';

class DealsCubit extends Cubit<DealsState> {
  DealsCubit(this.dealsRepository) : super(const Idle());
  int defaultCategoryIndex = 0;
  int defaultDealStatusCategory = 0;
  int defaultDealTypeCategory = 0;
  int defaultDealPatternCategory = 0;

  int worldViewCategoriesDefaultIndex = 0;
  List<DealModel> allDeals = [];
  List<DealModel> dealsOfAllDealsCategory = [];
  final DealsRepository dealsRepository;

  void changeCategory(String selectedCategoryName) {
    emit(const DealsState.changeCategoryLoading());
    emit(DealsState.changeCategorySuccedded(selectedCategoryName));
  }

  // backTo(index) {
  //   screenIndex = index;
  //   emit(const DealsState.back());
  // }
  //
  // backToAfterBack(index) {
  //   screenIndex = index;
  //   emit(const DealsState.backAfterBack());
  // }

  showWorldViewSelectedVIew() {
    switch (worldViewCategoriesDefaultIndex) {
      case 0:
        screenIndex = 13;
        emit(const DealsState.farmProducts());

        break;
      case 1:
        screenIndex = 13;
        emit(const DealsState.animalProducts());

        break;
      case 2:
        screenIndex = 13;
        emit(const DealsState.farmEquipments());

        break;
      case 3:
        screenIndex = 13;
        emit(const DealsState.animalEquipments());

        break;
      default:
    }
  }

  showSelectedStatusView() {
    switch (defaultDealStatusCategory) {
      case 0:
        emit(const DealsState.allViewSelected());
        break;
      case 1:
        emit(const DealsState.shipPrepareViewSelected());
        break;
      case 2:
        emit(const DealsState.shippmentOnGoingViewSelected());
        break;
      case 3:
        emit(const DealsState.onTheWayViewSelected());
        break;
      default:
    }
  }

  showSelectedView() {
    switch (defaultCategoryIndex) {
      case 0:
        emit(const DealsState.myInfoViewSelected());
        break;
      case 1:
        emit(const DealsState.myOffersViewSelected());
        break;
      case 2:
        emit(const DealsState.myOngoingNegotiationSelected());
        break;
      default:
    }
  }

  showSelectedPattern() {
    switch (defaultDealPatternCategory) {
      case 0:
        emit(const DealsState.freshPatternSelected());
        break;
      case 1:
        emit(const DealsState.dryPatternSelected());
        break;
      case 2:
        emit(const DealsState.frozenPatternSelected());
        break;
      case 3:
        emit(const DealsState.cookedPatternSelected());
        break;
      case 4:
        emit(const DealsState.seedsPatternSelected());
        break;
      default:
    }
  }

  showPickedDealTypeView(int index) {
    switch (index) {
      case 0:
        screenIndex = 10;
        emit(const DealsState.worldSearchView());
        break;

      case 1:
        screenIndex = 11;
        emit(const DealsState.localSearchView());

        break;
      case 2:
        screenIndex = 7;
        emit(const DealsState.tamweelSearchView());

        break;
      default:
    }
  }

  showSelectedDealType() {
    switch (defaultDealTypeCategory) {
      case 0:
        emit(const DealsState.worldDealSelected());
        break;
      case 1:
        emit(const DealsState.localDealSelected());
        break;

      default:
    }
  }

  void getAllCategories({required String type}) async {
    emit(const DealsState.getCatogoriesLoading());

    var result = await dealsRepository.getAllCategories(type: type);
    result.when(
      success: (List<CategoryModel> categories) {
        // this.categories = categories;
        emit(DealsState.getCatogoriesSuccedded(categories));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(DealsState.getCatogoriesError(networkExceptions));
      },
    );
  }

  void getAllProducts() async {
    emit(const DealsState.getProductsLoading());

    var result = await dealsRepository.getAllProducts();
    result.when(
      success: (List<ProductsModel> products) {
        emit(DealsState.getProductsSuccedded(products));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(DealsState.getProductsError(networkExceptions));
      },
    );
  }

  void getDeals() async {
    emit(const DealsState.getDealsLoading());

    var result = await dealsRepository.getDeals();
    result.when(
      success: (List<DealModel> items) {
        allDeals = items;
        dealsOfAllDealsCategory = items;
        emit(DealsState.getDealsSuccedded(items));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(DealsState.getDealsError(networkExceptions));
      },
    );
  }

  void getDealDetails(int id) async {
    emit(const DealsState.getDealsLoading());

    var result = await dealsRepository.getDealDetails(id);
    result.when(
      success: (DealResponse model) {
        emit(DealsState.getDealsDetailsSuccedded(model));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(DealsState.getDealsDetailsError(networkExceptions));
      },
    );
  }
}
