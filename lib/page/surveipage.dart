import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SurveiPage extends StatefulWidget {
  const SurveiPage({super.key});

  @override
  State<SurveiPage> createState() => _SurveiPageState();
}

class _SurveiPageState extends State<SurveiPage> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    setState(() {});
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal membuka link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survei'),
        backgroundColor: const Color(0xFF42A5F5),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                      'Survei Kepuasan Masyarakat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42A5F5),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Berikan penilaian Anda terhadap layanan ISI Yogyakarta melalui survei berikut.',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF42A5F5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                      ),
                      icon: const Icon(Icons.poll_outlined, color: Colors.white),
                      label: const Text(
                        'Isi Survei Kepuasan Masyarakat',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => _launchUrl('https://pandu.isi.ac.id/survey-kepuasan-masyarakat/'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
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
                      'Survei Kepuasan Pegawai',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF26A69A),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Dalam rangka untuk meningkatkan kualitas dan kepuasan para pegawai di Lingkungan Institut Seni Indonesia Yogyakarta, di mohon kepada Bapak dan Ibu untuk dapat mengisi kuisioner berikut ini untuk menjadi bahan masukan dan evaluasi bagi Instansi.\n\nDemikian atas perhatian dan bantuannya, kami mengucapkan terima kasih.\n\nLink Kuesioner:',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF26A69A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                      ),
                      icon: const Icon(Icons.link_rounded, color: Colors.white),
                      label: const Text(
                        'Isi Survei Kepuasan Pegawai',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => _launchUrl('https://s.id/SurveiKepuasanPegawaiISI'),
                    ),
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