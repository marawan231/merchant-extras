import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_balance.dart';
import '../../data/models/wallet_info.dart';
import '../../../../core/web_services/network_exceptions.dart';
part 'menu_state.freezed.dart';

@freezed
class MenuState<T> with _$MenuState<T> {
  const factory MenuState.idle() = Idle<T>;

  const factory MenuState.walletInfoLoading() = WalletInfoLoading<T>;

  const factory MenuState.walletInfoSuccedded(WalletInfo data) =
      WalletInfoSuccedded<T>;

  const factory MenuState.walletInfoError(DioExceptionType networkExceptions) =
      WalletInfoError<T>;

  const factory MenuState.walletBlanceAddedLoading() =
      WalletBlanceAddedLoading<T>;

  const factory MenuState.walletBalanceAddedSuccedded(AddBalance data) =
      WalletBalanceAddedSuccedded<T>;

  const factory MenuState.walletBalanceAdddedError(
      DioExceptionType networkExceptions) = WalletBalanceAdddedError<T>;
  //rate
  const factory MenuState.rateLoading() = RateLoading<T>;

  const factory MenuState.rateSuccedded() = RateSuccedded<T>;

  const factory MenuState.rateError(DioExceptionType networkExceptions) =
      RateError<T>;
//send complain by phone and notes
  const factory MenuState.sendComplainLoading() = SendComplainLoading<T>;

  const factory MenuState.sendComplainSuccedded() = SendComplainSuccedded<T>;

  const factory MenuState.sendComplainError(
      DioExceptionType networkExceptions) = SendComplainError<T>;

  
}
