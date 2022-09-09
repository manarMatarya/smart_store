import 'package:flutter/material.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool loggedIn =
          SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name) ??
              false;
      String route = loggedIn ? '/home_screen' : '/on_boarding_screens';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
