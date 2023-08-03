import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_extras/features/home/presentation/screens/all_deals_view.dart';
import '../../features/home/presentation/screens/all_categories_view.dart';
import '../../features/payment/business_logic/cubit/payment_cubit.dart';
import '../../features/profile/business_logic/cubit/profile_cubit.dart';
import '../business_logic/cubit/global_cubit.dart';
import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/face_auth_view.dart';
import '../../features/deals/presentation/screens/world_deal_view.dart';
import '../../features/menu/business_logic/cubit/menu_cubit.dart';
import '../../features/notification/business_logic/cubit/notification_cubit.dart';
import '../../features/payment/presentation/screens/buy_selected_quantity_view.dart';
import '../../features/payment/presentation/screens/pay_view.dart';
import '../../features/payment/presentation/screens/tamweel_pay_view.dart';
import '../../features/profile/presentation/screens/account_verify_success_view.dart';

import '../../features/auth/presentation/screens/confirm_phone_view.dart';
import '../../features/auth/presentation/screens/main_auth_view.dart';
import '../../features/auth/presentation/screens/phone_auth_view.dart';
import '../../features/auth/presentation/screens/successful_auth_view.dart';
import '../../features/deals/business_logic/cubit/deals_cubit.dart';
import '../../features/deals/data/model/deal_model.dart';
import '../../features/deals/presentation/screens/add_deal_view.dart';
import '../../features/deals/presentation/screens/deal_deatils_view.dart';
import '../../features/deals/presentation/screens/deal_owner_details_view.dart';
import '../../features/deals/presentation/screens/deal_processing_view.dart';
import '../../features/deals/presentation/screens/my_deals_main_view.dart';
import '../../features/home/business_logic/home_cubit.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/home/presentation/screens/main_home_view.dart';
import '../../features/menu/presentation/screens/contact_success_view.dart';
import '../../features/menu/presentation/screens/contact_us_view.dart';
import '../../features/menu/presentation/screens/menu_view.dart';
import '../../features/menu/presentation/screens/rate_us_view.dart';
import '../../features/menu/presentation/screens/wallet_view.dart';
import '../../features/menu/presentation/screens/who_are_us_view.dart';
import '../../features/menu/presentation/screens/work_with_us_view.dart';
import '../../features/messages/business_logic/cubit/messages_cubit.dart';
import '../../features/messages/presentation/screens/chat_view.dart';
import '../../features/messages/presentation/screens/chats_view.dart';
import '../../features/messages/presentation/screens/messages_view.dart';
import '../../features/notification/presentation/screens/notification_view.dart';
import '../../features/payment/presentation/screens/account_upgrade.dart';
import '../../features/payment/presentation/screens/buyy_details_view.dart';
import '../../features/profile/presentation/screens/account_verfication_view.dart';
import '../../features/profile/presentation/screens/edit_profile_view.dart';
import '../../features/search/business_logic/cubit/search_cubit.dart';
import '../../features/search/presentation/screens/local_search_view.dart';
import '../../features/search/presentation/screens/pick_deal_type_to_search_in_view.dart';
import '../../features/search/presentation/screens/search_result_deal_item_details.dart';
import '../../features/search/presentation/screens/search_result_view.dart';
import '../../features/search/presentation/screens/world_search_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import 'injection.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  static const String phoneAuthViewRoute = "/phoneAuthViewRoute";
  static const String confirmPhoneViewRoute = "/confirmPhoneViewRoute";
  static const String successfulAuthViewRoute = "/successfulAuthViewRoute";
  static const String notificationViewRoute = "/notificationViewRoute";
  static const String worldSearchViewRoute = "/worldSearchViewRoute";
  static const String localSearchViewRoute = "/localSearchViewRoute";

  static const String searchResultViewRoute = "/searchResultViewRoute";
  static const String tamweelT4arkySearchViewRoute =
      "/tamweelT4arkySearchViewRoute";

  static const String pickDealTypeToSearchInViewRoute =
      "/pickDealTypeToSearchInViewRoute";
  static const String mainhomeviewRoute = "/mainhomeviewRoute";
  static const String homeviewRoute = "/homeviewRoute";
  //AllCategoriesView
  static const String allCategoriesViewRoute = "/allCategoriesViewRoute";
  //AllDealsView
  static const String allDealsRoute = "/allDealsViewRoute";

  static const String rateUsRoute = "/rateUsRoute";
  static const String tamweelPayViewRoute = "/tamweelPayViewRoute";

  static const String contactUsRoute = "/contactUsRoute";
  static const String contactSuccessRoute = "/contactSuccessRoute";
  static const String whoAreUsRoute = "/whoAreUsRoute";
  static const String menuViewRoute = "/menuViewRoute";
  static const String workWithUsRoute = "/workWithUsRoute";
  static const String walletRoute = "/walletRoute";
  static const String messagesRoute = "/messagesRoute";
  static const String chatsRoute = "/chatsRoute";

  static const String myDealsMainViewRoute = "/myDealsViewRoute";
  static const String searchResultDealItemDetails =
      "/searchResultDealItemDetails";

  static const String dealDetailsViewRoute = "/dealDetailsViewRoute";
  static const String editProfileRoute = "/editProfileRoute";
  static const String dealProcessingViewRoute = "/dealProcessingViewRoute";
  static const String addDealRoute = "/addDealRoute";
  static const String accountUpgradeRoute = "/accountUpgradeRoute";
  static const String dealOwnerRoute = "/dealOwnerRoute";
  static const String buyDetailsViewRoute = "/buyDetailsViewRoute";
  static const String chatViewRoute = "/chatViewRoute";
  static const String payViewRoute = "/payViewRoute";
  static const String faceAuthViewRoute = "/faceAuthViewRoute";
  static const String accountVerifySuccessViewRoute =
      "/accountVerifySuccessViewRoute";

  static const String accountVerficationViewRoute =
      "/accountVerficationViewRoute";
  static const String tamweelItemDetailsViewRoute =
      "/tamweelItemDetailsViewRoute";
  static const String buySelectedQuantityViewRoute =
      "/buySelectedQuantityViewRoute";
}

class RouteGenerator {
  static late AuthCubit authCubit;
  static late HomeCubit homeCubit;
  static late SearchCubit searchCubit;
  static late DealsCubit dealsCubit;
  static late MessagesCubit messagesCubit;
  static late GlobalCubit globalCubit;
  static late NotificationCubit notificationCubit;
  static late MenuCubit menuCubit;
  static late ProfileCubit profileCubit;
  static late PaymentCubit paymentCubit;

  RouteGenerator() {
    homeCubit = getIt<HomeCubit>();
    searchCubit = getIt<SearchCubit>();
    dealsCubit = getIt<DealsCubit>();
    messagesCubit = getIt<MessagesCubit>();
    authCubit = getIt<AuthCubit>();
    globalCubit = getIt<GlobalCubit>();
    notificationCubit = getIt<NotificationCubit>();
    menuCubit = getIt<MenuCubit>();
    profileCubit = getIt<ProfileCubit>();
    paymentCubit = getIt<PaymentCubit>();
  }

  static List screens = <Widget>[
    const HomeView(),
    const PickDealTypeToSearchInView(),
    BlocProvider.value(
      value: notificationCubit,
      child: const NotificationView(),
    ),
    MultiBlocProvider(providers: [
      BlocProvider.value(
        value: dealsCubit,
      ),
      BlocProvider.value(
        value: searchCubit,
      )
    ], child: const MyDealsMainView()),
    MultiBlocProvider(providers: [
      BlocProvider.value(
        value: globalCubit,
      ),
      BlocProvider.value(
        value: menuCubit,
      ),
    ], child: const MenuView()),
    BlocProvider.value(
      value: searchCubit,
      child: const WorldSearchView(),
    ),
    BlocProvider.value(
      value: searchCubit,
      child: const SearchResultView(),
    ),
    BlocProvider.value(
      value: messagesCubit,
      child: const ChatsView(),
    ),
    BlocProvider.value(
      value: dealsCubit,
      child: const WorldDealView(),
    ),
    BlocProvider.value(
      value: dealsCubit,
      child: const MyDealsMainView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeCubit),
        BlocProvider.value(value: searchCubit),
      ],
      child: const AllCategoriesView(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeCubit),
        BlocProvider.value(value: searchCubit),
      ],
      child: const AllDealsView(),
    ),
  ];

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.mainAuthViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authCubit,
                  child: const MainAuthView(),
                ));
      case Routes.phoneAuthViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authCubit,
                  child: const PhoneAuthView(),
                ));
      case Routes.confirmPhoneViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authCubit,
                  child: const ConfirmPhoneView(),
                ));
      case Routes.successfulAuthViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: homeCubit,
                  child: const SuccessfulAuthView(),
                ));
      case Routes.notificationViewRoute:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case Routes.pickDealTypeToSearchInViewRoute:
        return MaterialPageRoute(
            builder: (_) => const PickDealTypeToSearchInView());
      case Routes.worldSearchViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: searchCubit,
            child: const WorldSearchView(),
          ),
        );
      case Routes.mainhomeviewRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: homeCubit,
                  ),
                  BlocProvider.value(
                    value: searchCubit,
                  ),
                  BlocProvider.value(
                    value: menuCubit,
                  ),
                  BlocProvider.value(
                    value: messagesCubit,
                  ),
                  BlocProvider.value(
                    value: dealsCubit,
                  ),
                  BlocProvider.value(
                    value: profileCubit,
                  ),
                  BlocProvider.value(
                    value: globalCubit,
                  ),
                  BlocProvider.value(
                    value: notificationCubit,
                  ),
                ], child: const MainHomeView()));
      case Routes.allCategoriesViewRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: homeCubit),
                    BlocProvider.value(value: searchCubit),
                  ],
                  child: const AllCategoriesView(),
                ));
      case Routes.allDealsRoute:
        // final arguments = settings.arguments as Map;
        // final List<DealModel> deals = arguments['deals'];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: homeCubit),
                    BlocProvider.value(value: searchCubit),
                  ],
                  child: const AllDealsView(),
                ));
      case Routes.searchResultViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: searchCubit,
            child: const SearchResultView(),
          ),
        );
      case Routes.rateUsRoute:
        final arguments = settings.arguments as Map;
        final bool isDealRate = arguments['isDealRate'];
        final String dealId = arguments['dealId'];
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: menuCubit,
                  child: RateUsView(
                    dealId: dealId,
                    isDealRate: isDealRate,
                  ),
                ));
      case Routes.contactUsRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: menuCubit,
                  child: const ContactUsView(),
                ));
      case Routes.contactSuccessRoute:
        return MaterialPageRoute(builder: (_) => const ContactSuccessView());
      case Routes.whoAreUsRoute:
        return MaterialPageRoute(builder: (_) => const WhoAreUsView());
      case Routes.menuViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: globalCubit,
                  child: const MenuView(),
                ));
      case Routes.workWithUsRoute:
        return MaterialPageRoute(builder: (_) => const WorkWithUsView());
      case Routes.walletRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: menuCubit,
                  child: const WalletView(),
                ));
      case Routes.messagesRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: homeCubit,
                  child: const MessagesView(),
                ));
      case Routes.chatsRoute:
        return MaterialPageRoute(builder: (_) => const ChatsView());
      case Routes.myDealsMainViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: dealsCubit,
                  child: const MyDealsMainView(),
                ));
      case Routes.dealDetailsViewRoute:
        final arguments = settings.arguments as Map;
        final DealModel deal = arguments['deal'];
        return MaterialPageRoute(
            builder: (_) => DealDetailsView(
                  deal: deal,
                ));
      case Routes.editProfileRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: profileCubit, child: const EditProfileView()));
      case Routes.dealProcessingViewRoute:
        return MaterialPageRoute(builder: (_) => const DealProcessingView());
      case Routes.addDealRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: dealsCubit,
                  child: const AddDealView(),
                ));
      case Routes.accountUpgradeRoute:
        return MaterialPageRoute(builder: (_) => const AccountUpgrade());
      case Routes.dealOwnerRoute:
        return MaterialPageRoute(builder: (_) => const DealOwnerDetailsView());
      case Routes.localSearchViewRoute:
        return MaterialPageRoute(builder: (_) => const LocalSearchView());
      // case Routes.tamweelT4arkySearchViewRoute:
      //   return MaterialPageRoute(builder: (_) => const TamweelSearchView());
      case Routes.searchResultDealItemDetails:
        final arguments = settings.arguments as Map;

        final DealModel deal = arguments['deal'];
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: dealsCubit,
                child: SearchResultItemDealDetails(
                  deal: deal,
                )));
      case Routes.buyDetailsViewRoute:
        return MaterialPageRoute(builder: (_) => const BuyDetailsView());
      case Routes.chatViewRoute:
        return MaterialPageRoute(builder: (_) => const ChatView());
      case Routes.accountVerficationViewRoute:
        return MaterialPageRoute(
            builder: (_) => const AccountVerficationView());

      case Routes.payViewRoute:
        return MaterialPageRoute(builder: (_) => const PayView());
      case Routes.tamweelPayViewRoute:
        return MaterialPageRoute(builder: (_) => const TamweelPayView());
      case Routes.faceAuthViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authCubit,
                  child: const FaceAuthView(),
                ));
      case Routes.accountVerifySuccessViewRoute:
        return MaterialPageRoute(
            builder: (_) => const AccountVerifySuccessView());
      case Routes.buySelectedQuantityViewRoute:
        final arguments = settings.arguments as Map;
        final quantityFieldVisible = arguments['quantityFieldVisible'];
        final num total = arguments['total'];
        final String dealId = arguments['dealId'];
        final String quantity = arguments['quantity'];
        final String? unitPrice = arguments['unitPrice'];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: menuCubit),
                    BlocProvider.value(value: paymentCubit),
                    BlocProvider.value(value: dealsCubit),
                  ],
                  child: BuySelectedQuantityView(
                    unitPrice: unitPrice,
                    quantity: quantity,
                    totalToPay: total.toString(),
                    dealId: dealId,
                    quantityFieldVisible: quantityFieldVisible,
                  ),
                ));
      // case Routes.tamweelItemDetailsViewRoute:

      //   return MaterialPageRoute(
      //       builder: (_) => const TamweelItemDetailsView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.trim()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.trim())),
            ));
  }
}
