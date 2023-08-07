import 'package:bloc/bloc.dart';
import 'payment_state.dart';
import '../../data/repository/payment_repository.dart';

import '../../../../core/web_services/error_model.dart';
import '../../../../core/web_services/network_exceptions.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepository) : super(const PaymentState.idle());
  final PaymentRepository paymentRepository;
  String totalToPayV = '0.0';

  void changeTotalToPay(String totalToPay) {
    totalToPayV = totalToPay;

    emit(PaymentState.changeTotalToPaySuccedded(totalToPay));
  }
  // void getWalletInfo() async {
  // emit(const MenuState.walletInfoLoading());
  // // ignore: prefer_typing_uninitialized_variables
  // var result = await menuRepository.getWalletInfo();
  // result.when(
  //   success: (WalletInfo walletInfo) {
  //     currentBalance = walletInfo.availableBalance.toString();
  //     // notifications = notifications;
  //     emit(MenuState.walletInfoSuccedded(walletInfo));
  //   },
  //   failure: (DioExceptionType networkExceptions) {
  //     emit(MenuState.walletInfoError(networkExceptions));
  //   },
  // );

  // }

  //buy quantity
  void buyQuantity({
    required String dealId,
    required String quantity,
    required String countryId,
  }) async {
    // log('buyQuantity');
    emit(const PaymentState.buyQuantityLoading());
    // emit(const PaymentState.buyQuantitySuccedded());
    // log('buyQuantity after');

    var result = await paymentRepository.buyQuantity(
        dealId: dealId, quantity: quantity, countryId: countryId);
    result.when(
      success: (ErrorModel response) {
        // currentBalance = walletInfo.availableBalance.toString();
        // notifications = notifications;
        emit(const PaymentState.buyQuantitySuccedded());
      },
      failure: (DioExceptionType networkExceptions) {
        emit(PaymentState.buyQuantityError(networkExceptions));
      },
    );
  }
  //buy all quantity

  void buyAllQuantity({
    required String dealId,
    required String countryId,
  }) async {
    // log('buyQuantity');
    emit(const PaymentState.buyAllQuantityLoading());
    // emit(const PaymentState.buyQuantitySuccedded());
    // log('buyQuantity after');

    var result = await paymentRepository.buyAllQuantity(
        dealId: dealId, countryId: countryId);
    result.when(
      success: (ErrorModel response) {
        // currentBalance = walletInfo.availableBalance.toString();
        // notifications = notifications;
        emit(const PaymentState.buyAllQuantitySuccedded());
      },
      failure: (DioExceptionType networkExceptions) {
        emit(PaymentState.buyAllQuantityError(networkExceptions));
      },
    );
  }
}
