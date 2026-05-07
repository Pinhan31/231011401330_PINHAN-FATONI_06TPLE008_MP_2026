import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop Kampus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy sesuai kebutuhan soal [cite: 25-30]
    final List<Map<String, String>> workshops = [
      {
        "judul": "Workshop Flutter Dasar",
        "tanggal": "25 Oktober 2026",
        "lokasi": "Lab Multimedia 1",
        "kuota": "20 Peserta",
      },
      {
        "judul": "UI/UX Design with Figma",
        "tanggal": "28 Oktober 2026",
        "lokasi": "Aula Gedung B",
        "kuota": "50 Peserta",
      },
      {
        "judul": "Backend Development with Node.js",
        "tanggal": "02 November 2026",
        "lokasi": "Online (Zoom)",
        "kuota": "100 Peserta",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshop Kampus"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // Menggunakan ListView agar tampilan tidak penuh dan bisa di-scroll [cite: 17]
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          final item = workshops[index];
          return WorkshopCard(
            judul: item['judul']!,
            tanggal: item['tanggal']!,
            lokasi: item['lokasi']!,
            kuota: item['kuota']!,
          );
        },
      ),
    );
  }
}

// Widget kustom untuk kartu workshop agar kode utama lebih bersih
class WorkshopCard extends StatelessWidget {
  final String judul;
  final String tanggal;
  final String lokasi;
  final String kuota;

  const WorkshopCard({
    super.key,
    required this.judul,
    required this.tanggal,
    required this.lokasi,
    required this.kuota,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Workshop [cite: 26]
            Text(
              judul,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const Divider(), // Pemisah visual untuk kejelasan (UX) [cite: 19]
            const SizedBox(height: 8),

            // Tanggal [cite: 27]
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(tanggal),
              ],
            ),
            const SizedBox(height: 4),

            // Lokasi [cite: 28]
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(lokasi),
              ],
            ),
            const SizedBox(height: 4),

            // Kuota [cite: 29]
            Row(
              children: [
                const Icon(Icons.people, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text("Kuota: $kuota"),
              ],
            ),

            const SizedBox(height: 16),

            // Tombol Daftar [cite: 30]
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi pendaftaran
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("DAFTAR SEKARANG"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}