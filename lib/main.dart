import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/chat/chatscreen.dart';
import 'package:translationchat/Screens/chat/roomscreen.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'Screens/about_us/aboutus.dart';

import 'Screens/auth/login.dart';
import 'Screens/checknumberphone/checknumberphone.dart';
import 'Screens/settings/settings.dart';
import 'Screens/splashScreen/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => ChatProvider(),)

      //create: (_) => LocalizationProvider(),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: SplashScreen(),debugShowCheckedModeBanner: false);
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:   const ChatScreen (),
              debugShowCheckedModeBanner: false
          );
        }
      },
    );
  }
}