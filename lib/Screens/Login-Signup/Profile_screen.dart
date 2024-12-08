import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import 'package:medical/Screens/Views/articlePage.dart'; // Import Artikel jika diperlukan
import 'package:medical/Screens/Login-Signup/shedule_screen.dart'; // Import Appointment Page

class Profile_screen extends StatelessWidget {
  final List<Article> savedArticles;

  const Profile_screen({Key? key, required this.savedArticles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get current user from Firebase Auth
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF40bef0), // Changed to the specified color
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Profile section with image, name, and email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  // Profile image on the left
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("lib/icons/avatar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Name and email from Firebase Authentication
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? 'User Name',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        user?.email ?? 'user@example.com',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Main menu
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Appointment with ColorFiltered for icon color change
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Appointment Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleScreen(), // Assuming AppointmentPage is the page
                        ),
                      );
                    },
                    child: profile_list(
                      image: "lib/icons/appoint.png",
                      title: "Appointment",
                      color: const Color(0xFF40bef0), // Set color to #40bef0
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Divider(),
                  ),
                  // Logout
                  const profile_list(
                    image: "lib/icons/logout.png",
                    title: "Log out",
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class profile_list extends StatelessWidget {
  final String image;
  final String title;
  final Color color;

  const profile_list({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn), // Apply color filter
            child: Image.asset(
              image,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
