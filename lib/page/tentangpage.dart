import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  static const List<Map<String, dynamic>> aboutItems = [
    {'title': 'Profil ISI', 'icon': Icons.account_balance_outlined},
    {'title': 'Visi & Misi', 'icon': Icons.visibility_outlined},
    {'title': 'Struktur Organisasi', 'icon': Icons.device_hub_outlined},
    {'title': 'Statuta', 'icon': Icons.gavel_outlined},
    {'title': 'Renstra', 'icon': Icons.assessment_outlined},
    {'title': 'OTK', 'icon': Icons.architecture_outlined},
    {'title': 'Perjanjian Kinerja Rektor', 'icon': Icons.assignment_turned_in_outlined},
    {'title': 'Laporan Kinerja', 'icon': Icons.receipt_long_outlined},
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak bisa membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: aboutItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = aboutItems[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.white,
            shadowColor: const Color(0xFF42A5F5).withOpacity(0.08),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  builder: (context) {
                    String title = item['title'];
                    Widget detailWidget;
                    Widget closeButton = Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey, size: 28),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Tutup',
                      ),
                    );
                    if (title == 'Profil ISI') {
                      detailWidget = Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Profil ISI Yogyakarta',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Institut Seni Indonesia Yogyakarta',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Divider(height: 28, thickness: 1),
                                  const Text(
                                    'Institut Seni Indonesia Yogyakarta yang berdiri sejak 23 Juli 1984 adalah sebuah lembaga pendidikan tinggi seni dengan status negeri penuh di bawah Kementerian Riset, Teknologi, dan Pendidikan Tinggi Republik Indonesia. ISI Yogyakarta menyelenggarakan pendidikan Diploma, S1, S2 hingga S3 dengan berbagai bidang seni terlengkap dan terbaik di Indonesia.',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Sejarah',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'ISI Yogyakarta dibentuk atas dasar Keputusan Presiden RI No. 39/1984 tanggal 30 Mei 1984 dan diresmikan oleh Menteri Pendidikan dan Kebudayaan Prof. Dr. Nugroho Notosusanto pada tanggal 23 Juli 1984. ISI Yogyakarta dibentuk berdasarkan fusi atas tiga pendidikan tinggi seni yang sudah ada sebelumnya, yaitu Sekolah Tinggi Seni Rupa Indonesia “ASRI”, Akademi Musik Indonesia “AMI”, dan Akademi Seni Tari Indonesia “ASTI”.',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Ruang Lingkup',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'ISI Yogyakarta adalah perguruan tinggi negeri yang menyelenggarakan pendidikan akademik dalam kelompok disiplin ilmu pengetahuan di bidang seni dan jika memenuhi syarat dapat menyelenggarakan pendidikan akademik, profesi, dan vokasi sesuai dengan ketentuan Peraturan Perundang-undangan.',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                          closeButton,
                        ],
                      );
                    } else if (title == 'Visi & Misi') {
                      detailWidget = Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Visi & Misi',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const Divider(height: 28, thickness: 1),
                                  const Text(
                                    'Visi:',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Institut Seni Indonesia Yogyakarta menjadi pelopor perguruan tinggi seni nasional yang unggul, kreatif, dan inovatif berdasar Pancasila.',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Misi:',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '1. Menyelenggarakan pendidikan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
                                    '2. Menyelenggarakan penelitian dan penciptaan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
                                    '3. Menyelenggarakan pengabdian kepada masyarakat dalam bidang seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
                                    '4. Menyelenggarakan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan.\n'
                                    '5. Menyelenggarakan manajemen yang efektif, efisien, transparan, dan akuntabel (good governance).',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Tujuan:',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '1. Mewujudkan pendidikan seni yang menghasilkan sarjana dan ahli seni yang kreatif, produktif, inovatif, dan kompetitif.\n'
                                    '2. Mewujudkan penelitian dan penciptaan seni yang unggul, inovatif, berwawasan lingkungan, dan berbasis pada kearifan lokal.\n'
                                    '3. Mewujudkan dharma pengabdian kepada masyarakat secara berkelanjutan yang mampu meningkatkan kemandirian dan daya saing bangsa untuk kesejahteraan masyarakat.\n'
                                    '4. Mewujudkan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan yang menghasilkan academic benefit.\n'
                                    '5. Mewujudkan pengelolaan lembaga yang efektif, efisien, transparan, dan akuntabel (good governance).',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          closeButton,
                        ],
                      );
                    } else if (title == 'Struktur Organisasi') {
                      detailWidget = Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Struktur Organisasi',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const Divider(height: 28, thickness: 1),
                                  const Text(
                                    'Struktur organisasi ISI Yogyakarta terdiri dari Rektor, Wakil Rektor, Dekan, Ketua Jurusan, dan unit-unit pendukung lainnya. Berikut adalah beberapa nama pejabat utama:',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Rektor: Dr. Irwandi, S.Sn., M.Sn\n'
                                    'Wakil Rektor Bidang Akademik dan Perencanaan: Dr. Dewanto Sukistono, M.Sn\n'
                                    'Wakil Rektor Bidang Keuangan dan Umum: Dr. Suryati, M.Hum\n'
                                    'Wakil Rektor Bidang Kemahasiswaan, Kerja Sama, dan Alumni: Dr. M. Kholid Arif Rozaq, S.Hut., M.M\n\n'
                                    'Dekan Fakultas Seni Rupa dan Desain: Muhamad Sholahuddin, S.Sn., M.T\n'
                                    'Dekan Fakultas Seni Pertunjukan: Dr. I Nyoman Cau Arsana, S.Sn., M.Hum\n'
                                    'Dekan Fakultas Seni Media Rekam: Dr. Edial Rusli, SE., M.Sn\n'
                                    'Direktur Program Pascasarjana: Dr. Fortunata Tyasrinestu, S.S., M.Si\n\n'
                                    'Struktur lengkap dapat dilihat pada website resmi ISI Yogyakarta.',
                                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          closeButton,
                        ],
                      );
                    } else {
                      String sectionTitle = title;
                      String sectionContent = '';
                      String? linkUrl;

                      if (title == 'Statuta') {
                        sectionContent = 'Informasi detail mengenai Statuta ISI Yogyakarta dapat diakses melalui tautan berikut.';
                        linkUrl = 'https://pandu.isi.ac.id/statuta/';
                      } else if (title == 'Renstra') {
                        sectionContent = 'Informasi detail mengenai Renstra ISI Yogyakarta dapat diakses melalui tautan berikut.';
                        linkUrl = 'https://pandu.isi.ac.id/renstra/';
                      } else if (title == 'OTK') {
                        sectionContent = 'Informasi detail mengenai OTK ISI Yogyakarta dapat diakses melalui tautan berikut.';
                        linkUrl = 'https://pandu.isi.ac.id/otk/';
                      } else if (title == 'Perjanjian Kinerja Rektor') {
                        sectionContent = 'Informasi detail mengenai Perjanjian Kinerja Rektor ISI Yogyakarta dapat diakses melalui tautan berikut.';
                        linkUrl = 'https://pandu.isi.ac.id/pk-rektor/';
                      } else if (title == 'Laporan Kinerja') {
                        sectionContent = 'Informasi detail mengenai Laporan Kinerja ISI Yogyakarta dapat diakses melalui tautan berikut.';
                        linkUrl = 'https://pandu.isi.ac.id/laporan-kinerja/';
                      }
                      detailWidget = Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    sectionTitle,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF42A5F5),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const Divider(height: 28, thickness: 1),
                                  Text(
                                    sectionContent,
                                    style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                                  ),
                                  if (linkUrl != null) ...[
                                    const SizedBox(height: 16),
                                    GestureDetector(
                                      onTap: () => _launchURL(linkUrl!),
                                      child: Text(
                                        '🔗 Lihat Detail $sectionTitle',
                                        style: const TextStyle(
                                          color: Color(0xFF42A5F5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                          closeButton,
                        ],
                      );
                    }
                    return detailWidget;
                  },
                );
              },
              child: ListTile(
                leading: Icon(item['icon'], color: const Color(0xFF42A5F5), size: 28),
                title: Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}