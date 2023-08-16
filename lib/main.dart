import 'package:aviralportfolio/pages/homePage.dart';
import 'package:aviralportfolio/provider/mousePointer.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB-B4yNfdVGz7oozPuigLVWttHhQgW2r0Q",
        authDomain: "aviral-s-portfolio.firebaseapp.com",
        projectId: "aviral-s-portfolio",
        storageBucket: "aviral-s-portfolio.appspot.com",
        messagingSenderId: "874321052691",
        appId: "1:874321052691:web:c145766a65ce1b8d35abe6",
        measurementId: "G-FMLBRD030Z"),
  );
  runApp(
    MultiProvider(providers: [
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
      home: HomePage(),
    );
  }
}
