import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/error_model.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_textfield.dart';
import '../../data/models/add_balance.dart';
import '../../data/models/wallet_info.dart';
import '../../data/repository/menu_repository.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(const MenuState.idle());

  final MenuRepository menuRepository;
  final TextEditingController amountController = TextEditingController();
  String currentBalance = '0';
  String easyToUseRateing = '1';
  String responsiveRateing = '1';
  String supportRateing = '1';
  String updatesRateing = '1';
  String overallRateing = '1';

//send complain by phone and notes
  void sendComplain({
    required String phone,
    required String notes,
  }) async {
    emit(const MenuState.sendComplainLoading());
    var result = await menuRepository.sendComplain(phone, notes);
    result.when(
      success: (ErrorModel errorModel) {
        emit(const MenuState.sendComplainSuccedded());
      },
      failure: (DioExceptionType networkExceptions) {
        emit(MenuState.sendComplainError(networkExceptions));
      },
    );
  }

//  WalletInfo walletInfo ;
  void clearRating() {
    easyToUseRateing = '1';
    responsiveRateing = '1';
    supportRateing = '1';
    updatesRateing = '1';
    overallRateing = '1';
  }

  void getWalletInfo() async {
    emit(const MenuState.walletInfoLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.getWalletInfo();
    result.when(
      success: (WalletInfo walletInfo) {
        currentBalance = walletInfo.availableBalance.toString();
        // notifications = notifications;
        emit(MenuState.walletInfoSuccedded(walletInfo));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(MenuState.walletInfoError(networkExceptions));
      },
    );
  }

  void addAmountToWallet() async {
    emit(const MenuState.walletBlanceAddedLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.addBalanceToWallet(amountController.text);
    result.when(
      success: (AddBalance addBalance) {
        // notifications = notifications;
        emit(MenuState.walletBalanceAddedSuccedded(addBalance));
      },
      failure: (DioExceptionType networkExceptions) {
        emit(MenuState.walletBalanceAdddedError(networkExceptions));
      },
    );
    //rate

//   var headers = {
//   'Authorization': 'Bearer 123'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://merchant-admin.com/api/user/wallet/balance/add'));
// request.fields.addAll({
//   'amount': _amountController.text,
// });

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//       var responseBody = await response.stream.bytesToString();
//     var jsonResponse = json.decode(responseBody);
// var status = jsonResponse['status'];
//     if (status == true){
//       // ignore: use_build_context_synchronously
//       Navigator.pop(context);
//       Commons.showToast(
//         message: 'Money Added Succefully',
//         color: ColorManager.green,
//       );
//     }
//     else{
//       Commons.showToast(
//         message: 'SomeThing Went Wrong',
//         color: ColorManager.red,
//       );
//     }

// }
// else {
//   // ignore: avoid_print
//   print(response.reasonPhrase);
// }
  }

  //rate
  void rateDeal({
    required String dealId,
    required String comment,
  }) async {
    emit(const MenuState.rateLoading());
    var result = await menuRepository.rate(dealId, easyToUseRateing,
        responsiveRateing, supportRateing, updatesRateing, comment);
    result.when(
      success: (ErrorModel errorModel) {
        emit(const MenuState.rateSuccedded());
      },
      failure: (DioExceptionType networkExceptions) {
        emit(MenuState.rateError(networkExceptions));
      },
    );
  }

  Future<void> showWalletAddAmountDialog(BuildContext context, Key formKey,
      {required void Function()? onTap}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              title: Center(
                child: Text(
                  AppStrings.enterAmount,
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: 18.sp),
                ),
              ),
              content: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextField(
                        keyboardType: TextInputType.number,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return AppStrings.enterAmount;
                          }
                          return null;
                        },
                        controller: amountController,
                        suffix: Text(
                          "",
                          style: getRegularStyle(
                              color: ColorManager.primary, fontSize: 14.sp),
                        ),
                        hint: "00.00",
                      ),
                      SizedBox(height: 15.h),
                      DefaultButton(
                        text: AppStrings.agree,
                        onTap: onTap,
                      ),
                    ],
                  )),
            ));
  }
}
