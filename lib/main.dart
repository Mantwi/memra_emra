import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memra/controller/provider/auth_provider/auth_provider.dart';
import 'package:memra/utils/theme.dart';
import 'package:memra/view/auth_screen/auth_screens.dart';
import 'package:memra/view/auth_screen/otp_screen.dart';
import 'package:memra/view/auth_screen/signInLogic.dart';
import 'package:memra/view/user/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'view/user/user_persistant_nav_bar/user_bottom_nav_bar.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Memra());
}

class Memra extends StatelessWidget {
  const Memra({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        //home: OTPScreen(
        // mobileNumber: '+15059131797',
        //  ),
        home: AuthScreen(),
        //home: HomeScreen(),
      ),
    );
  }
}
