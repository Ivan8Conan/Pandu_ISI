import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    setState(() {});
  }

  final List<_InfoItem> infoItems = const [
    _InfoItem(
      icon: Icons.info_outline_rounded,
      title: 'Informasi yang Tersedia Setiap Saat',
      url: 'https://pandu.isi.ac.id/informasi-yang-wajib-tersedia-setiap-saat/',
      color: Color(0xFF42A5F5),
    ),
    _InfoItem(
      icon: Icons.schedule_rounded,
      title: 'Informasi yang Wajib Disediakan dan Diumumkan Secara Berkala',
      url: 'https://pandu.isi.ac.id/informasi-yang-wajib-disediakan-dan-diumumkan-secara-berkala/',
      color: Color(0xFF26A69A),
    ),
    _InfoItem(
      icon: Icons.campaign_rounded,
      title: 'Informasi yang Wajib Diumumkan Secara Serta Merta',
      url: 'https://www.isi.ac.id/category/pengumuman/',
      color: Color(0xFFEF5350),
    ),
  ];

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
        title: const Text('Informasi'),
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
                      'Informasi Publik',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42A5F5),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Akses berbagai jenis informasi yang tersedia di ISI Yogyakarta sesuai ketentuan perundangan.',
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
            ...infoItems.map((item) => _buildInfoCard(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, _InfoItem item) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.97, end: 1.0),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 18),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _launchUrl(item.url),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Icon(item.icon, color: item.color, size: 32),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String title;
  final String url;
  final Color color;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.url,
    required this.color,
  });
}