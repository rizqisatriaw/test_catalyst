import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:test_catalyst/Models/get_games_response.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.data}) : super(key: key);

  GetGames data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsConst.secondaryColor,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                'Detail',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(data.thumb ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width - 70,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsConst.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.title ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 22,
                            ),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.steamRatingCount ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 18,
                            ),
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        data.salePrice ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 18,
                            ),
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        data.dealRating ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 18,
                            ),
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        data.metacriticScore ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 18,
                            ),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
