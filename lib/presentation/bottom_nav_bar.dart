import 'package:demo/presentation/album_screen/album_view.dart';
import 'package:demo/presentation/post_screen/post_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../data/pre_run_data.dart';
import '../manager/service_locator.dart';
import '../manager/session_data.dart';
import '../manager/session_manager.dart';
import 'home_screen/home_view.dart';

class BottomNavBar extends StatelessWidget {
    BottomNavBar({super.key});

  final PersistentTabController controller=PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: controller,
        screens: const [
          HomeView(),
          AlbumView(),
          PostView(),
        ],
        items:[
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_rounded),
            title: ("Home"),
            activeColorPrimary: Colors.tealAccent,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.photo_album_outlined),
            title: ("Album"),
            activeColorPrimary: Colors.tealAccent,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.post_add_rounded),
            title: ("Posts"),
            activeColorPrimary: Colors.tealAccent,
            inactiveColorPrimary: Colors.grey,
          ),
          // PersistentBottomNavBarItem(
          //   icon: const Icon(Icons.person),
          //   title: ("Profile"),
          //   activeColorPrimary: Colors.tealAccent,
          //   inactiveColorPrimary: Colors.grey,
          // ),

        ],
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
        NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
