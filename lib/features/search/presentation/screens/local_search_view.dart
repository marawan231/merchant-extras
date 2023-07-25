import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_extras/core/business_logic/cubit/global_cubit.dart';

class LocalSearchView extends StatelessWidget {
  const LocalSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            BlocProvider.of<GlobalCubit>(context).backTo(1);
          },
        ),
      ),
    );
  }
}
