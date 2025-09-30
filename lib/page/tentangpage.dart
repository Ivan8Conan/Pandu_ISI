import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  static const List<Map<String, dynamic>> primaryItems = [
    {'title': 'Profil ISI', 'icon': Icons.account_balance_outlined},
    {'title': 'Visi & Misi', 'icon': Icons.visibility_outlined},
    {'title': 'Struktur Organisasi', 'icon': Icons.people_outline},
  ];

  static const List<Map<String, dynamic>> legalItems = [
    {'title': 'Statuta', 'icon': Icons.gavel_outlined},
    {'title': 'Renstra', 'icon': Icons.assessment_outlined},
    {'title': 'OTK', 'icon': Icons.architecture_outlined},
  ];

  static const List<Map<String, dynamic>> reportItems = [
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
    final allItems = [primaryItems, legalItems, reportItems];
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Column(
        children: [
          const TentangHeader(),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                color: Color(0xFFF0F2F5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                children: [
                  _AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 50),
                    child: _buildItemGroup(context, primaryItems),
                  ),
                  const SizedBox(height: 16),
                  _AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 100),
                    child: _buildItemGroup(context, legalItems),
                  ),
                  const SizedBox(height: 16),
                  _AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 150),
                    child: _buildItemGroup(context, reportItems),
                  ),
                  const SizedBox(height: 32),
                  const Center(
                    child: Text(
                      'Version 1.0.0', 
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemGroup(BuildContext context, List<Map<String, dynamic>> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _InteractiveTile(
            icon: item['icon'],
            title: item['title'],
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                backgroundColor: Colors.white,
                isScrollControlled: true,
                builder: (context) {
                  return _buildBottomSheetContent(context, item);
                },
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F2F5)),
          );
        },
      ),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context, Map<String, dynamic> item) {
    String title = item['title'];
    Widget detailWidget;
    Widget closeButton = Positioned(
      right: 8,
      top: 8,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.grey, size: 28),
        onPressed: () => Navigator.of(context).pop(),
        tooltip: 'Tutup',
      ),
    );
    
    if (title == 'Profil ISI') {
      detailWidget = _buildDetailContent(
        context: context,
        closeButton: closeButton,
        children: [
          _buildModalTitle('Profil ISI Yogyakarta'),
          const Divider(height: 28, thickness: 1),
          _buildModalSectionTitle('Tentang'),
          _buildModalText(
              'Institut Seni Indonesia Yogyakarta yang berdiri sejak 23 Juli 1984 adalah sebuah lembaga pendidikan tinggi seni dengan status negeri penuh di bawah Kementerian Riset, Teknologi, dan Pendidikan Tinggi Republik Indonesia. ISI Yogyakarta menyelenggarakan pendidikan Diploma, S1, S2 hingga S3 dengan berbagai bidang seni terlengkap dan terbaik di Indonesia.'),
          const SizedBox(height: 16),
          _buildModalSectionTitle('Sejarah'),
          _buildModalText(
              'ISI Yogyakarta dibentuk atas dasar Keputusan Presiden RI No. 39/1984 tanggal 30 Mei 1984 dan diresmikan oleh Menteri Pendidikan dan Kebudayaan Prof. Dr. Nugroho Notosusanto pada tanggal 23 Juli 1984. ISI Yogyakarta dibentuk berdasarkan fusi atas tiga pendidikan tinggi seni yang sudah ada sebelumnya, yaitu Sekolah Tinggi Seni Rupa Indonesia “ASRI”, Akademi Musik Indonesia “AMI”, dan Akademi Seni Tari Indonesia “ASTI”.'),
          const SizedBox(height: 16),
          _buildModalSectionTitle('Ruang Lingkup'),
            _buildModalText(
              'ISI Yogyakarta adalah perguruan tinggi negeri yang menyelenggarakan pendidikan akademik dalam kelompok disiplin ilmu pengetahuan di bidang seni dan jika memenuhi syarat dapat menyelenggarakan pendidikan akademik, profesi, dan vokasi sesuai dengan ketentuan Peraturan Perundang-undangan.'),
        ],
      );
    } else if (title == 'Visi & Misi') {
        detailWidget = _buildDetailContent(
        context: context,
        closeButton: closeButton,
        children: [
          _buildModalTitle('Visi, Misi, dan Tujuan'),
          const Divider(height: 28, thickness: 1),
          _buildModalSectionTitle('Visi'),
          _buildModalText(
              'Institut Seni Indonesia Yogyakarta menjadi pelopor perguruan tinggi seni nasional yang unggul, kreatif, dan inovatif berdasar Pancasila.'),
          const SizedBox(height: 16),
            _buildModalSectionTitle('Misi'),
            _buildModalText(
              '1. Menyelenggarakan pendidikan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
              '2. Menyelenggarakan penelitian dan penciptaan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
              '3. Menyelenggarakan pengabdian kepada masyarakat dalam bidang seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
              '4. Menyelenggarakan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan.\n'
              '5. Menyelenggarakan manajemen yang efektif, efisien, transparan, dan akuntabel (good governance).'),
          const SizedBox(height: 16),
            _buildModalSectionTitle('Tujuan'),
            _buildModalText(
              '1. Mewujudkan pendidikan seni yang menghasilkan sarjana dan ahli seni yang kreatif, produktif, inovatif, dan kompetitif.\n'
              '2. Mewujudkan penelitian dan penciptaan seni yang unggul, inovatif, berwawasan lingkungan, dan berbasis pada kearifan lokal.\n'
              '3. Mewujudkan dharma pengabdian kepada masyarakat secara berkelanjutan yang mampu meningkatkan kemandirian dan daya saing bangsa untuk kesejahteraan masyarakat.\n'
              '4. Mewujudkan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan yang menghasilkan academic benefit.\n'
              '5. Mewujudkan pengelolaan lembaga yang efektif, efisien, transparan, dan akuntabel (good governance).'),
        ],
      );
    } else if (title == 'Struktur Organisasi') {
      detailWidget = _buildDetailContent(
        context: context,
        closeButton: closeButton,
        children: [
          _buildModalTitle('Struktur Organisasi'),
          const Divider(height: 28, thickness: 1),
          _buildModalText(
              'Struktur organisasi ISI Yogyakarta terdiri dari Rektor, Wakil Rektor, Dekan, Ketua Jurusan, dan unit-unit pendukung lainnya. Berikut adalah beberapa nama pejabat utama:'),
          const SizedBox(height: 16),
          _buildModalText(
              'Rektor: Dr. Irwandi, S.Sn., M.Sn\n'
              'Wakil Rektor Bidang Akademik dan Perencanaan: Dr. Dewanto Sukistono, M.Sn\n'
              'Wakil Rektor Bidang Keuangan dan Umum: Dr. Suryati, M.Hum\n'
              'Wakil Rektor Bidang Kemahasiswaan, Kerja Sama, dan Alumni: Dr. M. Kholid Arif Rozaq, S.Hut., M.M\n\n'
              'Dekan Fakultas Seni Rupa dan Desain: Muhamad Sholahuddin, S.Sn., M.T\n'
              'Dekan Fakultas Seni Pertunjukan: Dr. I Nyoman Cau Arsana, S.Sn., M.Hum\n'
              'Dekan Fakultas Seni Media Rekam: Dr. Edial Rusli, SE., M.Sn\n'
              'Direktur Program Pascasarjana: Dr. Fortunata Tyasrinestu, S.S., M.Si\n\n'
              'Struktur lengkap dapat dilihat pada website resmi ISI Yogyakarta.'),
        ],
      );
    } else {
      String sectionContent = 'Informasi detail mengenai $title ISI Yogyakarta dapat diakses melalui tautan berikut.';
      String? linkUrl;
      if (title == 'Statuta') linkUrl = 'https://pandu.isi.ac.id/statuta/';
      if (title == 'Renstra') linkUrl = 'https://pandu.isi.ac.id/renstra/';
      if (title == 'OTK') linkUrl = 'https://pandu.isi.ac.id/otk/';
      if (title == 'Perjanjian Kinerja Rektor') linkUrl = 'https://pandu.isi.ac.id/pk-rektor/';
      if (title == 'Laporan Kinerja') linkUrl = 'https://pandu.isi.ac.id/laporan-kinerja/';

      detailWidget = _buildDetailContent(
        context: context,
        closeButton: closeButton,
        children: [
          _buildModalTitle(title),
          const Divider(height: 28, thickness: 1),
          _buildModalText(sectionContent),
          if (linkUrl != null) ...[
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(linkUrl!),
                icon: const Icon(Icons.open_in_new),
                label: Text('Lihat Detail $title'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF0072FF),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ]
        ],
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: detailWidget,
    );
  }

  Widget _buildDetailContent({required BuildContext context, required Widget closeButton, required List<Widget> children}) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                ...children
              ],
            ),
          ),
        ),
        closeButton,
      ],
    );
  }

  Widget _buildModalTitle(String text) {
    return Text(text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF42A5F5),
        letterSpacing: 1,
      ),
    );
  }

  Widget _buildModalSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFF42A5F5),
        ),
      ),
    );
  }
  
  Widget _buildModalText(String text) {
    return Text(text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black87,
        height: 1.5
      ),
    );
  }
}

// Header tidak diubah, tetap sama
class TentangHeader extends StatelessWidget {
  const TentangHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0099FF), Color(0xFF0072FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/LOGO-ISI.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.school_outlined,
                          color: Colors.grey,
                          size: 30,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tentang Aplikasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Informasi & Profil ISI Yogyakarta",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedFadeInUp extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _AnimatedFadeInUp({required this.child, required this.delay});

  @override
  _AnimatedFadeInUpState createState() => _AnimatedFadeInUpState();
}

class _AnimatedFadeInUpState extends State<_AnimatedFadeInUp> {
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _isAnimated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: _isAnimated ? 0.0 : 1.0, end: _isAnimated ? 1.0 : 0.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1.0 - value) * 30),
            child: widget.child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

// Ganti _buildSettingsTile yang lama dengan ini
class _InteractiveTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _InteractiveTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_InteractiveTile> createState() => _InteractiveTileState();
}

class _InteractiveTileState extends State<_InteractiveTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        transform: _isPressed
            ? (Matrix4.identity()..scale(0.97))
            : Matrix4.identity(),
        child: ListTile(
          leading: Icon(widget.icon, color: const Color(0xFF0072FF), size: 24),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF333333),
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}