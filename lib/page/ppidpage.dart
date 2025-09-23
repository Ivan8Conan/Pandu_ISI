import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PPIDPage extends StatelessWidget {
  const PPIDPage({super.key});

  // Fungsi untuk membuka URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka $url');
    }
  }

  // Widget kartu menu
  Widget _buildMenuItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBgColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconBgColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0099FF),
        elevation: 0,
        title: const Text(
          'PPID',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color: Colors.white,
              shadowColor: const Color(0xFF42A5F5).withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PPID ISI Yogyakarta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42A5F5),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'PPID bertanggung jawab atas penyimpanan, pendokumentasian, penyediaan, dan pelayanan informasi.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildMenuItem(
              icon: Icons.account_circle,
              iconBgColor: Colors.pink,
              title: 'Profil PPID',
              subtitle:
                  'Informasi lengkap mengenai struktur dan profil PPID ISI Yogyakarta',
              onTap: () => _launchUrl('https://pandu.isi.ac.id/ppid/'),
            ),
            _buildMenuItem(
              icon: Icons.settings_suggest,
              iconBgColor: Colors.blueGrey,
              title: 'PPID Pelaksana',
              subtitle:
                  'Daftar dan informasi PPID pelaksana di lingkungan ISI Yogyakarta',
              onTap: () =>
                  _launchUrl('https://pandu.isi.ac.id/ppid-pelaksana/'),
            ),
            _buildMenuItem(
              icon: Icons.description,
              iconBgColor: Colors.orange,
              title: 'Maklumat Pelayanan',
              subtitle:
                  'Standar dan komitmen pelayanan informasi publik kepada masyarakat',
              onTap: () =>
                  _launchUrl('https://pandu.isi.ac.id/maklumat-pelayanan/'),
            ),
          ],
        ),
      ),
    );
  }
}