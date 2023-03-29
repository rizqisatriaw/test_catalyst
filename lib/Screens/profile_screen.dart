import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:test_catalyst/ViewModels/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? currentUser;
  String? displayName;
  String? email;
  String? photoUrl;

  @override
  Widget build(BuildContext context) {
    currentUser = FirebaseAuth.instance.currentUser;
    displayName = currentUser?.displayName ?? '';
    email = currentUser?.email ?? '';
    photoUrl = currentUser?.photoURL ?? '';
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
                'Profile',
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
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  image: NetworkImage(photoUrl != null
                      ? photoUrl!
                      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width - 70,
              height: MediaQuery.of(context).size.width / 3,
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
                        displayName != null ? displayName! : '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: ColorsConst.textColor,
                              fontSize: 22,
                            ),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email != null ? email! : '',
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
            InkWell(
              onTap: () async {
                ProfileProvider().signOut(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width - 200,
                height: MediaQuery.of(context).size.width / 8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorsConst.primaryColor,
                ),
                child: Text(
                  'Logout',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )));
  }
}
