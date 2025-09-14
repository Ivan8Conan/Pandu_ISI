import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

enum LayananKategori { all, pendidikan, kemahasiswaan, perpustakaan }

class ServiceItem {
  final IconData icon;
  final String title;
  final String url;
  final Color color;
  const ServiceItem({required this.icon, required this.title, required this.url, required this.color});
}

class LayananPage extends StatefulWidget {
  const LayananPage({super.key});

  @override
  State<LayananPage> createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  static const List<ServiceItem> layananPendidikan = [
    ServiceItem(icon: Icons.school_outlined, title: 'KRS Online', url: 'https://siak.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.person_add_alt_1_outlined, title: 'e-Admisi PMB', url: 'https://espmi.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.cast_for_education_outlined, title: 'e-Learning', url: 'https://elearning.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.workspace_premium_outlined, title: 'Wisuda', url: 'https://wisuda.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.document_scanner_outlined, title: 'e-SMPI', url: 'https://espmi.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.class_outlined, title: 'Open Class', url: 'https://openclass.isi.ac.id/', color: Color(0xFF0099FF)),
  ];

  static const List<ServiceItem> layananMahasiswa = [
    ServiceItem(icon: Icons.savings_outlined, title: 'Beasiswa', url: 'https://www.isi.ac.id/pendidikan/student-services/scholarship/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.work_outline, title: 'Karir dan Kewirausahaan', url: 'https://ppkk.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.emoji_events_outlined, title: 'Prestasi Mahasiswa', url: 'https://www.isi.ac.id/pendidikan/student-services/student-achievement/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.groups_outlined, title: 'Organisasi Kemahasiswaan', url: 'https://www.isi.ac.id/pendidikan/student-services/student-organizations/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.people_alt_outlined, title: 'Alumni', url: 'https://www.isi.ac.id/pendidikan/student-services/alumni/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.analytics_outlined, title: 'Tracer Study', url: 'https://tracerstudy.kemdikbud.go.id/', color: Color(0xFF0099FF)),
  ];

  static const List<ServiceItem> layananPerpustakaan = [
    ServiceItem(icon: Icons.article_outlined, title: 'e-Journal', url: 'https://journal.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.folder_zip_outlined, title: 'DIGILIB Repository', url: 'https://digilib.isi.ac.id/', color: Color(0xFF0099FF)),
    ServiceItem(icon: Icons.menu_book_outlined, title: 'OPAC', url: 'https://opac.isi.ac.id/#gsc.tab=0', color: Color(0xFF0099FF)),
  ];

  final TextEditingController _searchController = TextEditingController();
  LayananKategori _selectedKategori = LayananKategori.all;
  List<ServiceItem> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _filteredList = _getListByKategori(_selectedKategori);
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    setState(() {
      _filteredList = _getListByKategori(_selectedKategori);
    });
  }

  List<ServiceItem> _getListByKategori(LayananKategori kategori) {
    switch (kategori) {
      case LayananKategori.pendidikan:
        return layananPendidikan;
      case LayananKategori.kemahasiswaan:
        return layananMahasiswa;
      case LayananKategori.perpustakaan:
        return layananPerpustakaan;
      case LayananKategori.all:
        return [...layananPendidikan, ...layananMahasiswa, ...layananPerpustakaan];
    }
  }

  void _onKategoriChanged(LayananKategori? kategori) {
    if (kategori == null) return;
    _searchController.clear();
    setState(() {
      _selectedKategori = kategori;
      _filteredList = _getListByKategori(kategori);
    });
  }

  void _onSearch(String query) {
    final list = _getListByKategori(_selectedKategori);
    setState(() {
      _filteredList = list
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        title: const Row(
          children: [
            Text(
              "Layanan",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.white,
            shadowColor: const Color(0xFF42A5F5).withOpacity(0.10),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF42A5F5),
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Silakan pilih layanan yang Anda butuhkan.',
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
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF42A5F5),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearch,
                    decoration: const InputDecoration(
                      hintText: 'Cari layanan...',
                      prefixIcon: Icon(Icons.search, color: Color(0xFF42A5F5)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  padding: const EdgeInsets.only(right: 8),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LayananKategori>(
                      value: _selectedKategori,
                      icon: const Icon(Icons.filter_list, color: Color(0xFF42A5F5)),
                      style: const TextStyle(
                        color: Color(0xFF42A5F5),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: LayananKategori.all,
                          child: Text('Semua'),
                        ),
                        DropdownMenuItem(
                          value: LayananKategori.pendidikan,
                          child: Text('Pendidikan'),
                        ),
                        DropdownMenuItem(
                          value: LayananKategori.kemahasiswaan,
                          child: Text('Kemahasiswaan'),
                        ),
                        DropdownMenuItem(
                          value: LayananKategori.perpustakaan,
                          child: Text('Perpustakaan'),
                        ),
                      ],
                      onChanged: _onKategoriChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _filteredList.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      'Tidak ditemukan layanan.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                )
                : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return _buildServiceCard(context, _filteredList[index]);
                  },
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildServiceCard(BuildContext context, ServiceItem item) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.97, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final Uri url = Uri.parse(item.url);
            try {
              final bool launched = await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
              if (!launched) {
                await launchUrl(url, mode: LaunchMode.inAppWebView);
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tidak bisa membuka ${item.title}: $e')),
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          splashColor: item.color.withOpacity(0.3),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        item.color,
                        item.color.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}