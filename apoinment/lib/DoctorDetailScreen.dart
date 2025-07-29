import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DoctorsDetailScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class DoctorsDetailScreen extends StatefulWidget {
  const DoctorsDetailScreen({super.key});

  @override
  State<DoctorsDetailScreen> createState() => _DoctorsDetailScreenState();
}

class _DoctorsDetailScreenState extends State<DoctorsDetailScreen> {
  final List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  final List<String> timeSlots = [
    '10:00 AM',
    '11:30 AM',
    '01:00 PM',
    '02:30 PM',
    '04:00 PM',
    '05:30 PM',
  ];

  int selectedDayIndex = -1;
  int selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff90e0ef),
      body: SafeArea(
        child: Column(
          children: [
            // Doctor Info
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, size: screenWidth * 0.08),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.05),
                          Text(
                            "Dr. Ahmed",
                            style: TextStyle(fontSize: screenWidth * 0.065),
                          ),
                          const Text("Usasology"),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue.shade700,
                                child:
                                    const Icon(Icons.call, color: Colors.white),
                              ),
                              SizedBox(width: screenWidth * 0.015),
                              CircleAvatar(
                                backgroundColor: Colors.blue.shade700,
                                child: const Icon(Icons.video_call,
                                    color: Colors.white),
                              ),
                              SizedBox(width: screenWidth * 0.015),
                              CircleAvatar(
                                backgroundColor: Colors.blue.shade700,
                                child: const Icon(Icons.email,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Booking Section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF78C2F2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Appointment Day",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weekDays.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == selectedDayIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDayIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  weekDays[index],
                                  style: TextStyle(
                                    color:
                                        isSelected ? Colors.blue : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      "Select Time Slot",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    SizedBox(
                      height: screenHeight * 0.07,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) {
                          final isTimeSelected = index == selectedTimeIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTimeIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: isTimeSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  timeSlots[index],
                                  style: TextStyle(
                                    color: isTimeSelected
                                        ? Colors.blue
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedDayIndex == -1 ||
                              selectedTimeIndex == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please select both day and time."),
                              ),
                            );
                          } else {
                            String selectedDay = weekDays[selectedDayIndex];
                            String selectedTime = timeSlots[selectedTimeIndex];
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Appointment booked on $selectedDay at $selectedTime"),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue.shade800,
                          minimumSize:
                              Size(screenWidth * 0.8, screenHeight * 0.06),
                        ),
                        child: Text(
                          'Make Appointment',
                          style: TextStyle(fontSize: screenWidth * 0.045),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String time;
  final String day;
  final bool containerSelected;

  const DateWidget({
    Key? key,
    required this.time,
    required this.day,
    this.containerSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: containerSelected ? Colors.white24 : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            day,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  final String time;
  final bool selected;

  const TimeWidget({
    Key? key,
    required this.time,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.blue.shade700 : Colors.white,
        ),
      ),
    );
  }
}
