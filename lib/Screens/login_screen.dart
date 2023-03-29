import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_catalyst/Constant/assets_const.dart';
import 'package:test_catalyst/Constant/colors_const.dart';
import 'package:provider/provider.dart';
import 'package:test_catalyst/ViewModels/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginProvider reader = context.read<LoginProvider>();
    LoginProvider watcher = context.watch<LoginProvider>();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorsConst.lightColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            AssetsConst.logoIcon,
                            width: 345,
                            height: 336,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 50,
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    reader.login(context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    height:
                                        MediaQuery.of(context).size.width / 7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: ColorsConst.primaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: ColorsConst.textColor,
                                            fontSize: 18,
                                          ),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
    );
  }
}
