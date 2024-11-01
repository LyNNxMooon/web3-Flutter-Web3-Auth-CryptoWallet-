import 'package:flutter/material.dart';
import 'package:web3_flutter/analytic_screen.dart';
import 'package:web3_flutter/asset_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:web3_flutter/exchange_screen.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key, required this.state, required this.address});
  final String state;
  final String address;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List<Widget> buildScreens() {
    return [
      const AnalyticScreen(),
      const ExchangeScreen(),
      AssetScreen(
        state: widget.state,
        address: widget.address,
      )
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: const Icon(
            Icons.analytics_outlined,
            color: Colors.white,
          ),
          inactiveIcon: const Icon(
            Icons.analytics_outlined,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: const Icon(
            Icons.swap_horiz_outlined,
            color: Colors.white,
          ),
          inactiveIcon: const Icon(
            Icons.swap_horiz_outlined,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: Colors.white,
          icon: const Icon(
            Icons.wallet,
            color: Colors.white,
          ),
          inactiveIcon: const Icon(
            Icons.wallet,
            color: Colors.grey,
          )),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,

      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,

      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.linearToEaseOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple,
      //padding: NavBarPadding.symmetric(horizontal: kSP25x),
      //hideNavigationBar: true,
      margin: EdgeInsets.all(0),
    );
  }
}
