import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/data/models/countries_currencies.dart';
import '../../../features/menu/data/models/settings_model.dart';
import '../../web_services/network_exceptions.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState<T> with _$GlobalState<T> {
  const factory GlobalState.idle() = Idle<T>;

  const factory GlobalState.logOutLoading() = LogOutLoading<T>;
  const factory GlobalState.logOutSuccess() = LogOutSuccess<T>;
  const factory GlobalState.logOutError(T data) = LogOutError<T>;

  const factory GlobalState.getUnReadNotificationCount(int count) =
      GetUnReadNotificationCount<T>;
  const factory GlobalState.stopNotificationsStreamState() =
      StopNotificationsStreamState<T>;
  const factory GlobalState.resumeNotificationsStreamState() =
      ResumeNotificationsStreamState<T>;

  const factory GlobalState.selectedIndexChanged(int index) =
      SelectedIndexChanged<T>;
  const factory GlobalState.back() = Back<T>;
  const factory GlobalState.backAfterBack(int index) = BackAfterBack<T>;
  //get app settings

  const factory GlobalState.getAllSettingsLoading() = GetAllSettingsLoading<T>;
  const factory GlobalState.getAllSettingsSuccess(
      List<SettingsModel> settings) = GetAllSettingsSuccess<T>;
  const factory GlobalState.getAllSettingsError(T data) =
      GetAllSettingsError<T>;
       const factory GlobalState.countriesCurrenciesLoading() =
      CountriesCurrenciesLoading<T>;

  const factory GlobalState.countriesCurrenciesSuccess(
      List<CountriesCurrencies> userData) = CountriesCurrenciesSuccess<T>;

  const factory GlobalState.countriesCurrenciesError(
      DioExceptionType networkExceptions) = CountriesCurrenciesError<T>;
}
/*


 */
