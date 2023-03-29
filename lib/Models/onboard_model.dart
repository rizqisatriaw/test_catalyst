import 'package:test_catalyst/Constant/assets_const.dart';

class OnboardModel {
  final String title;
  final String image;
  final String desc;

  OnboardModel({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardModel> contents = [
  OnboardModel(
    title: 'Get your favorite game',
    image: AssetsConst.board1Image,
    desc: 'We provide a variety of games you need for happiness.',
  ),
  OnboardModel(
    title: 'Guaranteed and Safe',
    image: AssetsConst.board2Image,
    desc: '100% original product and official warranty.',
  ),
  OnboardModel(
    title: 'Get notified when discount',
    image: AssetsConst.board3Image,
    desc: 'Dont miss our attractive promos and discounts Up to 70%.',
  ),
];
