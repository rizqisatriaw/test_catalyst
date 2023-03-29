import 'package:flutter/material.dart';
import 'package:test_catalyst/Constant/assets_const.dart';
import 'package:test_catalyst/ViewModels/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<SplashProvider>().isAlreadyLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsConst.logoIcon),
            ],
          ),
        ),
      ),
    );
  }
}
