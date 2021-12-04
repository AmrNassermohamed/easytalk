
import 'package:country_picker/country_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/auth/sucesscode.dart';
import 'package:translationchat/Screens/chat/chatscreen.dart';
import 'package:translationchat/Screens/chat/roomscreen.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'Screens/about_us/aboutus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/auth/login.dart';
import 'Screens/auth/signup.dart';
import 'Screens/chat/contactscreen.dart';
import 'Screens/checknumberphone/checknumberphone.dart';
import 'Screens/settings/settings.dart';
import 'Screens/splashScreen/splash.dart';
import 'contacts/contacts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => ChatProvider(),),
      ChangeNotifierProvider(create: (_) => UserProvider(),)
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
    final validationServiceUser = Provider.of<UserProvider>(context,listen: false);
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: SplashScreen(),debugShowCheckedModeBanner: false);
        } else {
          // Loading is done, return the app:
          return MaterialApp(

            title: 'easytalk',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
              supportedLocales: [
             Locale('en'),
             Locale('ar'),
             Locale('es'),
            const Locale('el'),
            const Locale('et'),
            const Locale('nb'),
            const Locale('nn'),
            const Locale('pl'),
            const Locale('pt'),
            const Locale('ru'),
            const Locale('hi'),
            const Locale('ne'),
            const Locale('uk'),
            const Locale('hr'),
            const Locale('tr'),
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
          ],
              localizationsDelegates: [
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
            home:  validationServiceUser.loginOrNot==true?const RoomScreen():Login(),
              debugShowCheckedModeBanner: false
          );
        }
      },
    );
  }
}
