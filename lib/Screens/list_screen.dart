import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:test_catalyst/Models/get_games_response.dart';
import 'package:test_catalyst/Screens/detail_screen.dart';
import 'package:test_catalyst/ViewModels/home_provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider reader = context.read<HomeProvider>();
    HomeProvider watcher = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              StickyHeader(
                header: Container(
                  width: MediaQuery.of(context).size.width,
                  color: ColorsConst.secondaryColor,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorsConst.primaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      onChanged: (x) => watcher.onSearchTextChanged(x),
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
                content: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) => cardLong(watcher.data?[i]),
                  itemCount: watcher.data?.length ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardLong(GetGames? data) {
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
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorsConst.darkGreyColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  data?.thumb ?? '',
                  height: 60,
                  width: 100,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
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
                    data?.salePrice ?? 'Rp 0',
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: ColorsConst.primaryColor,
                          fontSize: 16,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data?.steamRatingCount ?? '0',
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
    );
  }
}
