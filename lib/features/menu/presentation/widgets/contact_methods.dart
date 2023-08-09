import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/business_logic/cubit/global_cubit.dart';
import '../../business_logic/cubit/menu_cubit.dart';
import '../../business_logic/cubit/menu_state.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/default_button.dart';

import 'contact_item.dart';

class ContactMethods extends StatefulWidget {
  const ContactMethods({super.key});

  @override
  State<ContactMethods> createState() => _ContactMethodsState();
}

class _ContactMethodsState extends State<ContactMethods> {
  late GlobalCubit _globalCubit;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _globalCubit = BlocProvider.of<GlobalCubit>(context);
  }

  _buildMainMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ContactItem(
            iconData: ImageAssets.email,
            title: AppStrings.email,
            subTitle: _globalCubit.settingEmail),
        SizedBox(height: 24.w),
        ContactItem(
            iconData: ImageAssets.viber,
            title: AppStrings.phoneNumber.replaceAll(':', ''),
            subTitle: _globalCubit.settingPhone),
      ],
    );
  }

  _buildSocialContactMethods() {
    return Center(
      child: SizedBox(
        height: 50.h,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Commons.openUrl(_globalCubit.settingInstagram);
                      break;
                    case 1:
                      // add the [https]
                      Commons.openUrl(
                          "https://wa.me/${_globalCubit.settingsWhatsApp}"); // new line

                      break;
                    case 2:
                      Commons.openUrl(_globalCubit.settingTwitter);
                      break;
                    case 3:
                      Commons.openUrl(_globalCubit.settingSnapchat);
                      break;
                  }
                },
                child: Center(
                  child: Image.asset(
                    socialMedia[index],
                    width: 35.w,
                    height: 35.w,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 25.w);
            },
            itemCount: socialMedia.length),
      ),
    );
  }

  _buildDivider() {
    return Divider(
      color: ColorManager.dividerColor,
      thickness: .6,
    );
  }

  _buildTitleField() {
    return CustomTextField(
        validator: (p0) {
          if (p0!.isEmpty) {
            return 'من فضلك ادخل البيانات المطلوبة ';
          }
          return null;
        },
        onSaved: (p0) {
          _titleController.text = p0!;
        },
        controller: _titleController,
        title: AppStrings.messageTitle,
        suffix: const Text(''),
        hint: AppStrings.enterMessageTitle);
  }

  _buildNotesArea() {
    return CustomTextField(
        validator: (p0) {
          if (p0!.isEmpty) {
            return 'من فضلك ادخل البيانات المطلوبة ';
          }
          return null;
        },
        onSaved: (p0) {
          _notesController.text = p0!;
        },
        controller: _notesController,
        contentPadding: EdgeInsets.only(
          top: 70.h,
          right: 20.w,
        ),
        title: AppStrings.messages,
        suffix: const Text(''),
        hint: AppStrings.typeYourMessage);
  }

  _buildBloc() {
    return BlocListener<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          sendComplainSuccedded: () {
            Navigator.pushNamed(context, Routes.messageViewRoute, arguments: {
              'image': ImageAssets.doneIcon,
              'title': AppStrings.thanksForContactingUs,
              'description': AppStrings.willContactYouSoon,
            });
            _notesController.clear();
            _titleController.clear();
          },
        );
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h, bottom: 80.h),
          child: Column(children: [
            _buildBloc(),
            _buildMainMethods(),
            SizedBox(height: 20.h),
            _buildSocialContactMethods(),
            SizedBox(height: 20.h),
            _buildDivider(),
            SizedBox(height: 45.h),
            _buildTitleField(),
            SizedBox(height: 30.h),
            _buildNotesArea(),
            SizedBox(height: 80.h),
            BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                return DefaultButton(
                  isLoading: state is SendComplainLoading ? true : false,
                  text: AppStrings.send,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      BlocProvider.of<MenuCubit>(context).sendComplain(
                          title: _titleController.text,
                          notes: _notesController.text);
                    } else {
                      Commons.showToast(
                          message: 'من فضلك ادخل البيانات المطلوبة');
                    }
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
