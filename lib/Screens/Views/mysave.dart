import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Widgets/articlePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';

// Data contoh artikel yang disimpan
final List<Article> savedArticles = [
  Article(
    id: "1",
    judul: "Cara Menjaga Kesehatan Mental",
    isi: "Tips menjaga kesehatan mental di era modern...",
    kategori: "Kesehatan",
    tanggal: Timestamp.now(),
    gambar: {"url": "https://example.com/image1.jpg"},
    sumber: {"sumber": "https://example.com/article1"},
  ),
  Article(
    id: "2",
    judul: "Pentingnya Pola Makan Sehat",
    isi: "Panduan untuk menjaga pola makan yang baik...",
    kategori: "Gaya Hidup",
    tanggal: Timestamp.now(),
    gambar: {"url": "https://example.com/image2.jpg"},
    sumber: {"sumber": "https://example.com/article2"},
  ),
];

class MySave extends StatelessWidget {
  final List<Article> savedArticles;

  const MySave({Key? key, required this.savedArticles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: Image.asset("lib/icons/back2.png"),
          ),
          onPressed: (){

            Navigator.pushReplacement(
              context,
              PageTransition(
              type: PageTransitionType.rightToLeft,
              child: ArticlePage(savedArticles: savedArticles,)));
          },
        ),

        backgroundColor: const Color(0xFF40BEF0), // Warna biru utama
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Saved Articles",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Ikon warna putih
      ),
      body: savedArticles.isEmpty
          ? Center(
              child: Text(
                "No saved articles",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10), // Padding luar untuk kontainer
              itemCount: savedArticles.length,
              itemBuilder: (context, index) {
                final article = savedArticles[index];
                String? articleUrl = article.sumber?['sumber'];
                return GestureDetector(
                  onTap: () async {
                    if (articleUrl != null && articleUrl.isNotEmpty) {
                      try {
                        final Uri sumber = Uri.parse(articleUrl);
                        if (await canLaunchUrl(sumber)) {
                          await launchUrl(sumber, mode: LaunchMode.externalApplication);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tidak dapat membuka URL: $articleUrl')),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal membuka URL: $articleUrl')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('URL artikel tidak tersedia')),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: article.gambar != null && article.gambar!['url'] != null
                              ? Image.network(
                                  article.gambar!['url']!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.broken_image, color: Colors.grey),
                                ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.judul,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                article.isi,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                article.kategori,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF40BEF0), // Warna utama untuk kategori
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
