import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIconData {
  String name;
  String imagePath;
  Icon imageIcon;
  String selectedImagePath;
  Icon selectedImageIcon;
  bool isSelected;
  int index;
  AnimationController animationController;

  TabIconData({
    this.name = '',
    this.imagePath = '',
    this.imageIcon,
    this.index = 0,
    this.selectedImagePath = "",
    this.selectedImageIcon,
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconsList = [
    TabIconData(
      name: 'Kalkulator',
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      index: 0,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Profile',
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
  ];
}
