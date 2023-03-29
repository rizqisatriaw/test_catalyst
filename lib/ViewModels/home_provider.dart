import 'dart:core';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_catalyst/Constant/assets_const.dart';
import 'package:test_catalyst/Models/get_games_response.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  int current = 0;
  final CarouselController controller = CarouselController();
  TextEditingController searchController = TextEditingController();
  List<GetGames>? data;
  List<GetGames>? allData;

  bool isLoading = false;

  void setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeCurrent(int index) {
    current = index;
    notifyListeners();
  }

  List<String> imgList = [
    AssetsConst.banner2Image,
    AssetsConst.banner3Image,
    AssetsConst.banner4Image,
  ];

  Future<void> fetchGames() async {
    // setLoading();
    isLoading = true;
    // notifyListeners();
    const peopleListAPIUrl =
        'https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15';

    final response = await http.get(Uri.parse(peopleListAPIUrl));
    if (response.statusCode == 200) {
      log(response.body);
      data = getGamesFromJson(response.body);
      allData = data;
      isLoading = false;
      // notifyListeners();
      return;
    } else {
      isLoading = false;
      // notifyListeners();
      throw Exception('Failed to load games from API');
    }
  }

  void onSearchTextChanged(String text) {
    data =
        allData!.where((e) => e.title!.toLowerCase().contains(text)).toList();
    notifyListeners();
  }
}
