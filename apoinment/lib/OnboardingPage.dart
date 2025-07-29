import 'package:apoinment/DoctorDetailScreen.dart';
import 'package:apoinment/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  void handleLogin() {
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username == "ahmed" && password == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() {
        errorMessage = "Invalid username or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Text(
                "DOCTOR APPOINTMENT",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.06,
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              CircleAvatar(
                radius: screenWidth * 0.25,
                backgroundColor: const Color(0xff90e0ef),
                backgroundImage: const AssetImage("image/doctor.png"),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Ahmed Abdi Mohamed",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.045,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),

              // Username Field
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),

              SizedBox(height: screenHeight * 0.03),

              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.rubik(fontSize: screenWidth * 0.05),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              ElevatedButton(
                onPressed: () {
                  // Future Create Account functionality
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  foregroundColor: Colors.blue,
                ),
                child: Text(
                  "Create account",
                  style: GoogleFonts.rubik(fontSize: screenWidth * 0.05),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
