import 'package:aviralportfolio/pages/caseStudy.dart';
import 'package:aviralportfolio/pages/homePage.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/provider/mousePointer.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:custom_zoom_widget/custom_zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'provider/themeProvider.dart';

void main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB-B4yNfdVGz7oozPuigLVWttHhQgW2r0Q",
          authDomain: "aviral-s-portfolio.firebaseapp.com",
          projectId: "aviral-s-portfolio",
          storageBucket: "aviral-s-portfolio.appspot.com",
          messagingSenderId: "874321052691",
          appId: "1:874321052691:web:c145766a65ce1b8d35abe6",
          measurementId: "G-FMLBRD030Z"));
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TestimonialListProvider()),
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
    return MaterialApp(
      title: """Aviral's Portfolio""",
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      // home: CustomZoomWidget(maxScale: 1, child: CaseStudy()),
      home: CustomZoomWidget(maxScale: 1, child: HomePage()),
    );
  }
}
