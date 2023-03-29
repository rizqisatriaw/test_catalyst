import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_catalyst/Constant/assets_const.dart';
import 'package:test_catalyst/Constant/colors_const.dart';

class NavigatorModel {
  final Widget image;
  final String title;
  final Widget active;

  NavigatorModel({
    required this.image,
    required this.title,
    required this.active,
  });
}

List<NavigatorModel> contentNavigators = [
  NavigatorModel(
    image: SvgPicture.asset(
      AssetsConst.homeSvg,
    ),
    title: 'Home',
    // Text('Home', style: TextStyle(color: ColorsConst.inActive)).toString(),
    active: SvgPicture.asset(
      AssetsConst.home1Svg,
      width: 28,
    ),
  ),
  NavigatorModel(
      image: SvgPicture.asset(AssetsConst.listSvg),
      // title: Text('List', style: TextStyle(color: ColorsConst.inActive))
      //     .toString(),
      title: 'List',
      active: SvgPicture.asset(
        AssetsConst.list1Svg,
        width: 28,
      )),
  NavigatorModel(
      image: SvgPicture.asset(AssetsConst.profileSvg),
      // title: Text('Profile', style: TextStyle(color: ColorsConst.inActive))
      //     .toString(),
      title: 'Profile',
      active: SvgPicture.asset(
        AssetsConst.profile1Svg,
        width: 24,
      )),
];
