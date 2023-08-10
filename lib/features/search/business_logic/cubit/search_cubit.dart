import 'package:bloc/bloc.dart';
import '../../../deals/data/model/deal_model.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/category_model.dart';
import '../../data/models/products_model.dart';
import '../../data/repository/search_repository.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(const Idle());
  String title = AppStrings.world;
  int searchViewDefaultindex = 0;
  int patternInFilterFormCategoreisIndex = 0;
  int worldViewCategoriesDefaultIndex = 0;
  int arrangmentInFilterFormCategoreisIndex = 0;
  final SearchRepository searchRepository;
  List<CategoryModel> categories = [];
  List<ProductsModel> products = [];
  List<DealModel> deals = [];
  List<DealModel> searchedList = [];
  // List<DealModel> deals1 = [];

  String? selectedCategoryId;

  String? geography;
  String? categoryId;
  String? productId;
  // String ? currencyId;
  double? priceFrom = 0;
  double? priceTo = 10000;
  String? amount;
  String? shape;
  String? orderBy;

  void search() {
    emit(const SearchState.searchLoading());
    // searchedList != [] ? deals = searchedList : deals = deals;
    emit(const SearchState.searchSucceded());
  }

  void getAllCategories() async {
    emit(const SearchState.getCatogoriesLoading());

    var result = await searchRepository.getAllCategories();
    result.when(
      success: (List<CategoryModel> categories) {
        this.categories = categories;
        emit(SearchState.getCatogoriesSuccedded(categories));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(SearchState.getCatogoriesError(networkExceptions));
      },
    );
  }

  void resetFilter() {
    geography = null;
    categoryId = null;
    productId = null;
    // currencyId = null;
    priceFrom = null;
    priceTo = null;
    amount = null;
    shape = null;
    orderBy = null;
    deals = [];
    emit(const SearchState.resetFilter());
  }

  void getAllProducts() async {
    emit(const SearchState.getProductsLoading());

    var result = await searchRepository.getAllProducts();
    result.when(
      success: (List<ProductsModel> products) {
        this.products = products;
        emit(SearchState.getProductsSuccedded(products));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(SearchState.getProductsError(networkExceptions));
      },
    );
  }

  _clearValues() {
    priceFrom = null;
    priceTo = null;
    amount = null;
    shape = null;
    orderBy = null;
  }

  void filter() async {
    priceFrom ??= 0;
    priceTo ??= 10000;
    emit(const SearchState.filterLoading());

    var result = await searchRepository.filterProducts(
      geography: geography ?? 'international',
      categoryId: categoryId,
      productId: productId,
      // currencyId: currencyId,
      priceFrom: priceFrom.toString(),
      priceTo: priceTo.toString(),
      amount: amount,
      shape: shape,
      orderBy: orderBy ?? 'oldest',
    );
    result.when(
      success: (List<DealModel> deals) {
        this.deals = deals;
        _clearValues();
        emit(SearchState.filterSucceded(deals));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(SearchState.filterError(networkExceptions));
      },
    );
  }
  // filter

  //
  // backToAfterBack(index) {
  //   screenIndex = index;
  //   emit(const SearchState.backAfterBack());
  // }
  //
  // backTo(index) {
  //   screenIndex = index;
  //   emit(const SearchState.back());
  // }
  //
  // changeSelectedIndex(int index) {
  //   screenIndex = index;
  //   selectedTab = index;
  //   emit(SearchState.selectedIndexChanged(index));
  // }

  void changeToSearchCategoriesView() {
    searchViewDefaultindex = 0;
    emit(const SearchState.searchCategoriesView());
  }

  void changeToSelectedSearchCategoryResultView() {
    searchViewDefaultindex = 1;
    emit(const SearchState.selectedSearchCategoryResultView());
  }

  void showSelectedArrangmentChoice() {
    switch (arrangmentInFilterFormCategoreisIndex) {
      case 0:
        orderBy = 'cheapest';
        emit(const SearchState.fromCheabestSelected());

        break;
      case 1:
        orderBy = 'recent';
        emit(const SearchState.fromHighestSelected());

        break;

      default:
    }
  }

  void tooglePattern() {
    switch (patternInFilterFormCategoreisIndex) {
      case 0:
        shape = 'طازج';
        emit(const SearchState.freshPatternSelected());

        break;
      case 1:
        shape = 'مجفف';

        emit(const SearchState.dryPatternSelected());

        break;
      case 2:
        shape = 'مجمد';
        emit(const SearchState.frozenPatternSelected());

        break;
      default:
    }
  }

  // showPickedSearchTypeView(int index) {
  //   switch (index) {
  //     case 0:
  //       screenIndex = 5;
  //       emit(const SearchState.worldSearchView());
  //       break;

  //     case 1:
  //       screenIndex = 6;
  //       emit(const SearchState.localSearchView());

  //       break;
  //     case 2:
  //       screenIndex = 7;
  //       emit(const SearchState.tamweelSearchView());

  //       break;
  //     default:
  //   }
  // }

  // showWorldViewSelectedVIew() {
  //   switch (worldViewCategoriesDefaultIndex) {
  //     case 0:
  //       screenIndex = 8;
  //       emit(const SearchState.farmProducts());

  //       break;
  //     case 1:
  //       screenIndex = 8;
  //       emit(const SearchState.animalProducts());

  //       break;
  //     case 2:
  //       screenIndex = 8;
  //       emit(const SearchState.farmEquipments());

  //       break;
  //     case 3:
  //       screenIndex = 8;
  //       emit(const SearchState.animalEquipments());

  //       break;
  //     default:
  //   }
  // }
}
