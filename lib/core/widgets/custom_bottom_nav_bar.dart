import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

import '../resources/strings_manager.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar(
      {super.key,
      required this.onTap,
      required this.selectedIndex,
      required this.notificationCount});

  final void Function(int index)? onTap;
  final int selectedIndex;
  final int notificationCount;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //elevstion
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 10,
            offset: const Offset(0, -1),
          )
        ],
        // border: Border(
        //   top: BorderSide(
        //     color: Theme.of(context).primaryColor,
        //     width: .5,
        //   ),
        // ),
      ),
      child: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        // This is all you need!

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageAssets.house,
              color: widget.selectedIndex == 0 ? ColorManager.primary : null,
            ),
            label: AppStrings.main,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageAssets.homeSearch,
              color: widget.selectedIndex == 1 ? ColorManager.primary : null,
            ),
            label: AppStrings.theSearch,
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Image.asset(
                  ImageAssets.homeBell,
                  color:
                      widget.selectedIndex == 2 ? ColorManager.primary : null,
                ),
                widget.notificationCount == 0
                    ? const SizedBox()
                    : Container(
                        width: 9.w,
                        height: 9.w,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
              ],
            ),
            label: AppStrings.notification,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageAssets.layers,
              color: widget.selectedIndex == 3 ? ColorManager.primary : null,
            ),
            label: AppStrings.manageDeals,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: widget.selectedIndex == 4 ? ColorManager.primary : null,
            ),
            label: AppStrings.menu,
          ),
        ],
        currentIndex: widget.selectedIndex > 4 ? 3 : widget.selectedIndex,
        onTap: widget.onTap!,
      ),
    );
  }
}
