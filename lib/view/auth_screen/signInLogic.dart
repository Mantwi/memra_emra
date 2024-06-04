import 'package:flutter/material.dart';
import 'package:memra/view/auth_screen/auth_screens.dart';
import 'package:page_transition/page_transition.dart';

import '../../controller/services/auth_services/auth_services.dart';
import '../user/home/home_screen.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false)
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/memra_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
