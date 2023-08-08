import 'package:flutter/material.dart';
import 'package:merchant_extras/features/menu/data/models/menu_model.dart';

import '../../features/auth/data/models/auth_method.dart';
import '../../features/deals/data/model/category_model.dart';
import '../../features/search/data/models/main_search_item.dart';
import 'assets_manager.dart';
import 'route_manager.dart';
import 'strings_manager.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int goToHomeDelay = 1;
  static const double appBarHeight = 55;
  static const int sliderAnimationTime = 300;
  static const int timeOut = 60;
  static const String baseUrl = 'https://merchant-plaftorm.com/api/';
}

String localPlaceHolder = ImageAssets.androidArrow;

List<String> rateTitles = [
  AppStrings.easyUse,
  AppStrings.responsive,
  AppStrings.support,
  AppStrings.updates,
  AppStrings.overall,
];
String defaultUId = '0';
String userName = 'اسم المستخدم';
String? token = '123';
String? uid;
String dialCode = '+20';
String? countryCode = 'SA';
String userPhone = '';
String userImage = 'https://pib-platform.com/profile.png';
String userEmail = '';
String refferNumber = '';
int screenIndex = 0;
int selectedTab = 0;

final List<String> viewsTitles = [
  AppStrings.main,
  AppStrings.search,
  AppStrings.notification,
  AppStrings.manageDeals,
  AppStrings.menu,
];
final List<String> addDealCategoriesTitles = [
  AppStrings.world,
  AppStrings.local,
];
final List<String> choicesList = [
  AppStrings.fresh,
  AppStrings.dry,
  AppStrings.frozen
];

final List<String> patternsList = [
  AppStrings.fresh,
  AppStrings.dry,
  AppStrings.frozen,
  AppStrings.cooked,
  AppStrings.seeds,
];
final List<String> arrangmentChoicesList = [
  AppStrings.fromCheapeastToExpensive,
  AppStrings.fromExpensiveToCheapeast,
];
final List<String> switchAccountCategories = [
  AppStrings.seller,
  AppStrings.buyer,
];
final List<String> messagesCategories = [
  AppStrings.offersSended,
  AppStrings.offersOnMyDeals,
];
final List<DealsCategoryModel> myDealsCategories = [
  // AppStrings.myInfo,
  // AppStrings.myOffers,
  // AppStrings.goingNegotiateStatus,

  DealsCategoryModel(id: 1, name: 'all'),
  DealsCategoryModel(id: 2, name: 'active'),
  DealsCategoryModel(id: 3, name: 'processing'),
  DealsCategoryModel(id: 4, name: 'out_for_delivery'),
  DealsCategoryModel(id: 5, name: 'complete'),
  DealsCategoryModel(id: 6, name: 'closed'),
];

bool? switchToBuyerVersion = true;
final List<String> orderCategories = [
  AppStrings.all,
  AppStrings.shipMaking,
  AppStrings.transaferProgressing,
  AppStrings.onWay,
];

List<String> socialMedia = [
  ImageAssets.instagram,
  ImageAssets.whatsapp,
  ImageAssets.twitter,
  ImageAssets.snapchat,
];
List<AuthMethod> authMethods = [
  AuthMethod(ImageAssets.phone, AppStrings.authWithPhone),
  AuthMethod(ImageAssets.faceId, AppStrings.authWithFace),
  AuthMethod(ImageAssets.google, AppStrings.authWithGoogle),
];

List<AuthMethod> worldViewCategories = [
  // AuthMethod(ImageAssets.fruits, AppStrings.fruit),
  AuthMethod(ImageAssets.vegetables, AppStrings.farmProducts),
  AuthMethod(ImageAssets.animals, AppStrings.animalProducts),
  AuthMethod(ImageAssets.farmEquipments, AppStrings.farmingEquipments),
  AuthMethod(ImageAssets.animalEquipments, AppStrings.animalEquipments),
];

List<MainSearchItem> mainSearchList = [
  MainSearchItem(Icons.public, AppStrings.world),
  MainSearchItem(Icons.pin_drop_outlined, AppStrings.local),
];
List<String> worldSearchCategories = [
  Routes.searchResultViewRoute,
  Routes.searchResultViewRoute,
  Routes.searchResultViewRoute,
  Routes.searchResultViewRoute,
];
List<String> pickedSearchRoutes = [
  Routes.worldSearchViewRoute,
  Routes.localSearchViewRoute,
  Routes.tamweelT4arkySearchViewRoute,
];
int defaultIndex = -1;
int maiSearchListDefaultIndex = -1;
int payMethodDefaultIndex = 0;

double rateNumber = 1.0;

List<String> menuViewItemTitles = [
  AppStrings.workAs,
  AppStrings.myWallet,
  AppStrings.rateUs,
  AppStrings.contactUs,
  AppStrings.whoAreUs,
  AppStrings.logOut,
];

List<String> menuViewItemRoutes = [
  Routes.workWithUsRoute,
  Routes.walletRoute,
  Routes.rateUsRoute,
  Routes.contactUsRoute,
  Routes.whoAreUsRoute,
  // Routes.splashRoute,
];
List<MenuModel> menuList = [
  MenuModel(
      title: AppStrings.workAs,
      icon: ImageAssets.user,
      route: Routes.workWithUsRoute),
  MenuModel(
      title: AppStrings.myWallet,
      icon: ImageAssets.wallet,
      route: Routes.walletRoute),
  MenuModel(
      title: AppStrings.rateUs,
      icon: ImageAssets.star,
      route: Routes.rateUsRoute),
  MenuModel(
      title: AppStrings.contactUs,
      icon: ImageAssets.contactMail,
      route: Routes.contactUsRoute),
  MenuModel(
      title: AppStrings.whoAreUs,
      icon: ImageAssets.about,
      route: Routes.whoAreUsRoute),
  MenuModel(
      title: AppStrings.termsAndConditions,
      icon: ImageAssets.fileDocumentBox,
      route: Routes.whoAreUsRoute),
  MenuModel(
      title: AppStrings.logOut,
      icon: ImageAssets.signOut,
      route: Routes.walletRoute),
];

List<String> buyDetailesTitles = [
  AppStrings.theWallet,
  // '',
  AppStrings.paypal,
  AppStrings.visa,
];

List<String> buyDetailesIcons = [
  // '',
  ImageAssets.wallet,
  ImageAssets.paypal,
  ImageAssets.visa,
];
