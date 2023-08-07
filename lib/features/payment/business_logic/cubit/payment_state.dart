import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/web_services/network_exceptions.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState<T> with _$PaymentState<T> {
  const factory PaymentState.idle() = Idle<T>;

  //buy quantity
  const factory PaymentState.buyQuantityLoading() = BuyQuantityLoading<T>;

  const factory PaymentState.buyQuantitySuccedded() = BuyQuantitySuccedded<T>;

  const factory PaymentState.buyQuantityError(
      DioExceptionType networkExceptions) = BuyQuantityError<T>;
  //buy all quantity

  const factory PaymentState.buyAllQuantityLoading() = BuyAllQuantityLoading<T>;

  const factory PaymentState.buyAllQuantitySuccedded() =
      BuyAllQuantitySuccedded<T>;

  const factory PaymentState.buyAllQuantityError(
      DioExceptionType networkExceptions) = BuyAllQuantityError<T>;

  //changeTotalToPay
  const factory PaymentState.changeTotalToPayLoading() =
      ChangeTotalToPayLoading<T>;

  const factory PaymentState.changeTotalToPaySuccedded(String totalToPay) =
      ChangeTotalToPaySuccedded<T>;

  const factory PaymentState.changeTotalToPayError(
      DioExceptionType networkExceptions) = ChangeTotalToPayError<T>;
}
