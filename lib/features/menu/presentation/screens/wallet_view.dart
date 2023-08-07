import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/menu_cubit.dart';
import '../../business_logic/cubit/menu_state.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../data/models/add_balance.dart';
import '../../data/models/wallet_info.dart';
import '../widgets/transaction_item.dart';
import '../widgets/wallet_card.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  _buildBloc() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          walletBlanceAddedLoading: () => Commons.showLoadingDialog(context),
          walletInfoError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              message: networkExceptions.toString(),
              color: ColorManager.red,
            );
          },
          walletBalanceAddedSuccedded: (AddBalance addBalance) {
            BlocProvider.of<MenuCubit>(context).amountController.clear();
            Navigator.pop(context);
            Navigator.pop(context);

            Commons.showToast(
              message: 'تم اضافة الرصيد بنجاح',
              color: ColorManager.green,
            );
            BlocProvider.of<MenuCubit>(context).getWalletInfo();
          },
          walletBalanceAdddedError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              message: networkExceptions.toString(),
              color: ColorManager.red,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          walletInfoSuccedded: (walletInfo) {
            return _buildWalletViewBody(walletInfo);
          },
          orElse: () {
            return const LoadingIndicator();
          },
        );
      },
    );
  }

  _buildWalletViewBody(WalletInfo walletInfo) {
    return ListView(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),

      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        WalletCard(
          totalBalance: walletInfo.totalBalance.toString(),
          date: walletInfo.transactions!.isEmpty
              ? DateFormat('yyyy-MM-dd').format(DateTime.now())
              : walletInfo.transactions?.first.time ?? '',
        ),
        SizedBox(height: 32.h),
        _buildTransactionsHeadline(),
        SizedBox(height: 20.h),
        _buildListOfTransactions(walletInfo),
      ],
    );
  }

  _buildTransactionsHeadline() {
    return Text(
      AppStrings.latestTransactions,
      style: getBoldStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    );
  }

  _buildListOfTransactions(WalletInfo walletInfo) {
    return walletInfo.transactions!.isEmpty
        ? const EmptyScreen()
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TransactionItem(
                date: walletInfo.transactions![index].time ?? '',
                amount: walletInfo.transactions![index].amount.toString(),
                type: walletInfo.transactions![index].type ?? '',
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15.h);
            },
            itemCount: walletInfo.transactions!.length > 10
                ? 5
                : walletInfo.transactions!.length);
  }

  //walletInfo.transactions!.length

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MenuCubit>(context).getWalletInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myWallet),
      ),
      body: _buildBloc(),
    );
  }
}
