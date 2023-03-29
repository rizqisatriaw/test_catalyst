import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:test_catalyst/Models/navigator_model.dart';
import 'package:test_catalyst/Screens/home_screen.dart';
import 'package:test_catalyst/Screens/list_screen.dart';
import 'package:test_catalyst/Screens/profile_screen.dart';
import 'package:test_catalyst/ViewModels/navigator_provider.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  var currentTab = [
    const HomeScreen(),
    const ListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    NavigatorProvider navigatorProvider = Provider.of(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: currentTab[navigatorProvider.currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorsConst.darkGreyColor,
          unselectedLabelStyle: TextStyle(color: ColorsConst.primaryColor),
          currentIndex: navigatorProvider.currentIndex,
          onTap: (index) {
            navigatorProvider.currentIndex = index;
          },
          items: contentNavigators
              .map(
                (e) => BottomNavigationBarItem(
                    icon: e.image, label: e.title, activeIcon: e.active),
              )
              .toList()),
    );
  }
}
