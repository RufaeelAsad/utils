import 'package:flutter/material.dart';
import 'package:screen_recorder/core/utils/size_utils.dart';
import 'package:screen_recorder/theme/theme_helper.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: appTheme.white,
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.adaptSize),
        child: Container(
          height: 60.v,
          color: appTheme.primary,
          child: Row(
            children: [
              navItem(
                Icons.home_outlined,
                pageIndex == 0,
                onTap: () => onTap(0),
                index: 0,
              ),
              navItem(
                Icons.photo_album_outlined,
                pageIndex == 1,
                onTap: () => onTap(1),
                index: 1,
              ),
              navItem(
                Icons.video_settings_sharp,
                pageIndex == 2,
                onTap: () => onTap(2),
                index: 2,
              ),
              navItem(
                Icons.settings,
                pageIndex == 3,
                onTap: () => onTap(3),
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected,
      {Function()? onTap, required int index}) {
    return Expanded(
      child: InkWell(
          onTap: onTap,
          child: selected
              ? Container(
                  width: 60.h,
                  height: 45.v,
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 35.adaptSize,
                      color: appTheme.bottomBarIconColor,
                    ),
                  ),
                )
              : Icon(
                  icon,
                  size: 30.adaptSize,
                  color: appTheme.white,
                )),
    );
  }
}
