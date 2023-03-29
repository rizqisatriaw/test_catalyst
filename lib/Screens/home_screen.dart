import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:test_catalyst/Models/get_games_response.dart';
import 'package:test_catalyst/Screens/detail_screen.dart';
import 'package:test_catalyst/ViewModels/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final postMdl = Provider.of<HomeProvider>(context, listen: false);
    postMdl.fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider reader = context.read<HomeProvider>();
    HomeProvider watcher = context.watch<HomeProvider>();

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ColorsConst.secondaryColor,
            body: ListView(
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Expanded(
                      child: CarouselSlider(
                        items: reader.imgList
                            .map(
                              (item) => Container(
                                margin: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        carouselController: reader.controller,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            reader.changeCurrent(index);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: reader.imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              watcher.controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : ColorsConst.primaryColor)
                                  .withOpacity(
                                watcher.current == entry.key ? 0.9 : 0.4,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
                StickyHeader(
                  header: Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorsConst.secondaryColor,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 9,
                      decoration: BoxDecoration(
                        color: ColorsConst.primaryColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: TextField(
                        onChanged: (x) => reader.onSearchTextChanged(x),
                        controller: reader.searchController,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: ColorsConst.textColor,
                            fontSize: 16,
                          ),
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(color: ColorsConst.textColor),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  content: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, i) => cardShort(watcher.data?[i]),
                    itemCount: watcher.data?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 3.6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (watcher.isLoading)
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsConst.primaryColor,
                  value: 30,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget cardShort(GetGames? data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              data: data!,
            ),
          ),
        );
      },
      child: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsConst.darkGreyColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.network(
                  data?.thumb ?? '',
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.title ?? '',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: ColorsConst.textColor,
                            fontSize: 16,
                          ),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data?.salePrice ?? 'Rp. 0',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: ColorsConst.primaryColor,
                            fontSize: 16,
                          ),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data?.steamRatingText ?? '',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: ColorsConst.primaryColor,
                            fontSize: 12,
                          ),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
