import 'package:app/data/TabIconData.dart';
import 'package:app/view/calc.dart';
import 'package:app/widget/bottom_bar_view.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Profile();

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[1].isSelected = true;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future.delayed(
      const Duration(milliseconds: 50),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox();
                } else {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      tabBody,
                      bottomBar(),
                    ],
                  );
                }
              }),
        ),
        onWillPop: () async => false);
  }

  Widget bottomBar() {
    return Column(
      children: [
        Expanded(child: SizedBox()),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) return;
                setState(
                  () {
                    tabBody = Calc();
                  },
                );
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) return;
                setState(
                  () {
                    tabBody = Profile();
                  },
                );
              });
            }
          },
        ),
      ],
    );
  }
}
