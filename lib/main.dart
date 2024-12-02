import 'package:aviralportfolio/pages/NewUI/ChatPage.dart';
import 'package:aviralportfolio/pages/NewUI/HomePage2.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/provider/UpSliderProvider.dart';
import 'package:aviralportfolio/provider/mousePointer.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'provider/themeProvider.dart';

void main() async {
  // await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB-B4yNfdVGz7oozPuigLVWttHhQgW2r0Q",
          authDomain: "aviral-s-portfolio.firebaseapp.com",
          projectId: "aviral-s-portfolio",
          storageBucket: "aviral-s-portfolio.appspot.com",
          messagingSenderId: "874321052691",
          appId: "1:874321052691:web:c145766a65ce1b8d35abe6",
          measurementId: "G-FMLBRD030Z"));
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('shavi2110'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  // await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TestimonialListProvider()),
      ChangeNotifierProvider(create: (context) => ProjectUpSliderProvider()),
      ChangeNotifierProvider(create: (context) => ProjectListProvider()),
      ChangeNotifierProvider(create: (context) => ExperinceListProvider()),
      ChangeNotifierProvider(create: (context) => SkillListProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => SkillTypeProvider()),
      ChangeNotifierProvider(create: (context) => MousePointerProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return const MaterialApp(
      title: """Aviral's Portfolio""",
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      // home: CustomZoomWidget(maxScale: 1, child: CaseStudy()),
      // home: CustomZoomWidget(maxScale: 1, child: HomePage()),
      home: HomePage2(),
      // home: Chatpage(),
      // home: MovingDotsPage(
      //   w: w,
      //   h: h,
      // ),
    );
  }
}
