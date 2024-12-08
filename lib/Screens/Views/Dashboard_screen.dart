import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:medical/Screens/Views/doctor_search.dart';
// import 'package:medical/Screens/Widgets/article.dart';
import 'package:medical/Screens/Widgets/banner.dart';
import 'package:medical/Screens/Widgets/list_doctor1.dart';
import 'package:medical/Screens/Widgets/listicons.dart';
//import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
         actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.20,
              child: Image.asset(
                "images/Logo RS Sentosa.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            
            Text(
              "Healthcare RS Sentosa",
              style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          //Body Start fro here
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              listIcons(Icon: "lib/icons/stetoskop.png", text: "Dokter"),
              listIcons(Icon: "lib/icons/rumah sakit.png", text: "Rumah Sakit"),
              listIcons(Icon: "lib/icons/ambulans.png", text: "Ambulans"),
            ],
          ),

          //List icons (Can Edit in Widgets )
          const SizedBox(
            height: 10,
          ),
          const banner(),
          // Banner Design
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Dokter",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           type: PageTransitionType.rightToLeft,
                  //           child: const doctor_search()));
                  // },
                  child: Text(
                    "Lihat Semua",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 64, 190, 254),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 180,
              width: 400,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const [
                  list_doctor1(
                      image: "lib/icons/Adik.jpeg",
                      maintext: "Dr. Adik N",
                      numRating: "4.8",
                      subtext: "Spesial Kandungan"),
                  list_doctor1(
                      image: "lib/icons/Dian.jpeg",
                      maintext: "Dr. Dian F",
                      numRating: "4.7",
                      subtext: "Spesialis Anak"),
                  list_doctor1(
                      image: "lib/icons/Cela.jpeg",
                      maintext: "Dr. Sheila N",
                      numRating: "4.8",
                      subtext: "Spesialis Saraf"),
                  list_doctor1(
                      image: "lib/icons/Aul.jpeg",
                      maintext: "Dr. Annisa A",
                      numRating: "4.7",
                      subtext: "Spesialis Mata"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Artikel Kesehatan",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 46, 46, 46),
                  ),
    
    
                 ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           type: PageTransitionType.rightToLeft,
                  //           child: const articlePage()));
                  // },
                  child: Text(
                    "Lihat Semua",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 64, 190, 240),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // //Article banner here import from widget>article
          // const article(
          //     image: "images/bacaan.jpg",
          //     dateText: " ",
          //     duration: "",
          //     mainText:
          //         "Sudah mulai masuk musim hujan nih,\nyuk Jaga Kesehatan!"),
        ]),
      ),
    );
  }
}