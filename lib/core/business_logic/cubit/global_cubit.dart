import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/data/models/countries_currencies.dart';
import '../../../features/auth/data/repository/auth_repository.dart';
import '../../../features/menu/data/models/settings_model.dart';
import '../../../features/menu/data/repository/menu_repository.dart';
import '../../../features/notification/data/repository/notification_repository.dart';
import '../../resources/constants.dart';
import '../../web_services/network_exceptions.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState<dynamic>> {
  GlobalCubit(
      this.notificationsRepository, this.menuRepository, this.authRepoistry)
      : super(const GlobalState.idle());

  NotificationRepository notificationsRepository;
  MenuRepository menuRepository;
  AuthRepoistry authRepoistry;
  String? chooseCountry;
  String? choosenCountryId ='1';

  int notificationCount = 0;
  Stream<int>? notificationStream;
  StreamSubscription<int>? notificationSubscription;
  String settingEmail = '';
  String settingPhone = '';
  String settingInstagram = '';
  String settingsWhatsApp = '';
  String settingTwitter = '';
  String settingSnapchat = '';
  String aboutUs = '';
  String privacy = '';
  String terms = '';
  List<CountriesCurrencies>? allCountriesCurrencies;
  void getAllCountriesCurrencies() async {
    emit(const GlobalState.countriesCurrenciesLoading());
    var result = await authRepoistry.getAllCountriesCurrencies();
    result.when(
      success: (List<CountriesCurrencies> countriesCurrencies) {
        allCountriesCurrencies = countriesCurrencies;
        emit(GlobalState.countriesCurrenciesSuccess(countriesCurrencies));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(GlobalState.countriesCurrenciesError(networkExceptions));
      },
    );
  }

  //get app settings
  Future<void> getAllSettings() async {
    emit(const GlobalState.getAllSettingsLoading());
    var result = await menuRepository.getAllSettings();
    result.when(
      success: (List<SettingsModel> settings) {
        aboutUs = settings[0].value!;
        settingEmail = settings[1].value!;
        settingPhone = settings[2].value!;
        settingInstagram = settings[6].value!;
        settingsWhatsApp = settings[2].value!;
        settingTwitter = settings[4].value!;
        settingSnapchat = settings[5].value!;
        privacy = settings[7].value!;
        terms = settings[8].value!;

        emit(GlobalState.getAllSettingsSuccess(settings));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(GlobalState.getAllSettingsError(networkExceptions));
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    try {
      emit(const GlobalState.logOutLoading());
      await FirebaseAuth.instance.signOut();
      emit(const GlobalState.logOutSuccess());
    } catch (e) {
      emit(GlobalState.logOutError(e.toString()));
    }
  }

  void startNotificationsStream() async {
    notificationStream = Stream.periodic(const Duration(seconds: 10))
        .asyncMap((event) async => await getAllNotificationCount())
        .distinct();
    notificationSubscription = notificationStream?.listen((event) {
      if (notificationCount == 0 || notificationCount != event) {
        notificationCount = event;
      } else {
        // emit(GlobalState.newMessage(event));
        notificationCount = event;
      }
    });
  }

  Future<int> getAllNotificationCount() async {
    var result = await notificationsRepository.getUnReadNotificationsCount();
    result.when(
      success: (count) {
        notificationCount = count.unreadCount!;
        emit(GlobalState.getUnReadNotificationCount(notificationCount));
      },
      failure: (DioExceptionType networkExceptions) {
        // emit(GlobalState.getUnreadMessagesCountError(networkExceptions));
      },
    );
    return notificationCount;
  }

  void stopNotificationsStream() {
    if (notificationSubscription != null) {
      notificationSubscription!.pause();
      notificationSubscription = null;
    }
    emit(const GlobalState.stopNotificationsStreamState());
  }

  void resumeNotificationsStream() {
    if (notificationSubscription!.isPaused) {
      startNotificationsStream();
    } else {}
    emit(const GlobalState.resumeNotificationsStreamState());
  }

  backToAfterBack(index) {
    screenIndex = index;
    emit(GlobalState.backAfterBack(index));
  }

  backTo(index) {
    screenIndex = index;
    emit(const GlobalState.back());
  }

  changeSelectedIndex(int index) {
    screenIndex = index;
    (index == 10 || index == 11) ? selectedTab = 0 : selectedTab = index;
    emit(GlobalState.selectedIndexChanged(index));
  }
}
