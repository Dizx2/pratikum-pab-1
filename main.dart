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
      title: 'Perpustakaan',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Background abu-abu sangat terang
        primaryColor: const Color(0xFF0F2C59), // Aksen Navy Blue
      ),
      home: const KategoriScreen(),
    );
  }
}

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PERPUSTAKAAN',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Banner Ruang Baca Digital
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=600'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: const Text(
                  'Ruang Baca Digital:\nPinjam & Baca Buku secara Gratis',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 2. Daftar Tombol Kategori
            _buildCategoryButton(
              context: context,
              label: 'Fiksi & Novel',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailBukuScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildCategoryButton(context: context, label: 'Teknologi & IT'),
            const SizedBox(height: 12),
            _buildCategoryButton(context: context, label: 'Sains & Matematika'),
            const SizedBox(height: 12),
            _buildCategoryButton(context: context, label: 'Sejarah Dunia'),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk membuat button kategori agar rapi
  Widget _buildCategoryButton({
    required BuildContext context,
    required String label,
    VoidCallback? onTap,
  }) {
    const Color navyColor = Color(0xFF0F2C59);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: navyColor,
        side: const BorderSide(color: navyColor, width: 1.5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: onTap ?? () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kategori "$label" belum tersedia.')),
        );
      },
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: navyColor,
        ),
      ),
    );
  }
}

class DetailBukuScreen extends StatelessWidget {
  const DetailBukuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navyColor = Color(0xFF0F2C59);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: navyColor),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // SUDAH FIXED: crossAxisAlignment yang benar
                children: [
                  // 1. Cover Buku (Placeholder)
                  Center(
                    child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=400'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 2. Judul & Penulis
                  const Text(
                    'Hujan',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    'Tere Liye',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 3. Deskripsi
                  const Text(
                    'Novel fiksi ilmiah bertema persahabatan, cinta, dan melupakan, berlatar masa depan setelah bencana besar.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 4. Badges (Spesifikasi Buku)
                  Row(
                    children: [
                      _buildInfoBadge('320 Hal'),
                      const SizedBox(width: 10),
                      _buildInfoBadge('Bahasa Indo'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 5. Tombol Pinjam Buku di Bagian Bawah
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navyColor,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Memicu Tampilan Pop-up Konfirmasi
                _showKonfirmasiDialog(context);
              },
              child: const Text(
                'Pinjam Buku',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget untuk membuat Badge Informasi
  Widget _buildInfoBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Biru muda soft
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF0F2C59),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  void _showKonfirmasiDialog(BuildContext context) {
    const Color navyColor = Color(0xFF0F2C59);

    showDialog(
      context: context,
      barrierDismissible: false, // User wajib memilih tombol
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Column(
            children: [
              Icon(Icons.bookmark_outline, size: 40, color: navyColor),
              SizedBox(height: 10),
              Text(
                'Konfirmasi Pinjam',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          content: const Text(
            'Apakah Anda yakin ingin meminjam buku ini?\nBatas waktu 7 Hari.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.3),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            // Tombol Batal
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black87,
                backgroundColor: Colors.grey[200],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Menutup dialog
              },
              child: const Text('Batal', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            // Tombol OK
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: navyColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Menutup dialog
                // Menampilkan snackbar sukses di halaman utama
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Buku "Hujan" berhasil dipinjam!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Ok', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}