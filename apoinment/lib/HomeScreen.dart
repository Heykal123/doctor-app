import 'package:apoinment/DoctorDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        leading: LineIcon(Icons.menu_open),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: LineIcon(Icons.notifications_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.2,
              width: double.infinity,
              color: Colors.blue.shade700,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi Ahmed",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.08,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: const [
                                  Categories_widget(
                                    lineic: LineIcon(
                                      LineIcons.teeth,
                                      color: Colors.white,
                                    ),
                                    titles: "Dental",
                                  ),
                                  SizedBox(width: 20),
                                  Categories_widget(
                                    lineic: Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ),
                                    titles: "Heart",
                                  ),
                                  SizedBox(width: 20),
                                  Categories_widget(
                                    lineic: LineIcon(
                                      LineIcons.eye,
                                      color: Colors.white,
                                    ),
                                    titles: "Eyes",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.08),
                        child: Container(
                          height: screenHeight * 0.4,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            ),
                            color: Colors.blue,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Top Doctors",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                                SizedBox(width: 10),
                                doctorsWidget(
                                  name: "Ahmed",
                                  title: "Usasology",
                                ),
                                SizedBox(width: 15),
                                doctorsWidget(
                                  name: "John",
                                  title: "Usasology",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -30,
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    height: screenHeight * 0.08,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, size: screenWidth * 0.06),
                        hintText: "Search...",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class doctorsWidget extends StatelessWidget {
  const doctorsWidget({super.key, required this.name, required this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => DoctorsDetailScreen())),
      child: Container(
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          color: const Color(0xff90e0ef),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. $name",
                      style: GoogleFonts.rubik(fontSize: screenWidth * 0.05),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.rubik(fontSize: screenWidth * 0.04),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  Icons.person_rounded,
                  size: screenWidth * 0.25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Categories_widget extends StatelessWidget {
  const Categories_widget({
    super.key,
    required this.lineic,
    required this.titles,
  });

  final Widget lineic;
  final String titles;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.25,
      width: screenWidth * 0.25,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          lineic,
          SizedBox(height: screenWidth * 0.02),
          Text(
            titles,
            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
          ),
        ],
      ),
    );
  }
}
