// import 'package:assigment/HomeScreen.dart';
// import 'package:assigment/OnboardingPage.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomeScreen(),
//   ));
// }

import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'DoctorDetailScreen.dart';
import 'OnboardingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'Doctor Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPage(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/doctor_details': (context) => const DoctorsDetailScreen(),
        '/onboarding': (context) => const OnboardingPage()
      },
    );
  }
}
