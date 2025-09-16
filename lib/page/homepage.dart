import 'dart:async';

import 'package:flutter/material.dart';
import 'layananpage.dart';
import 'tentangpage.dart';
import 'informasipage.dart';
import 'surveipage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    _HomeMenuGrid(key: UniqueKey()),
    const TentangPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    setState(() {
      _pages[0] = _HomeMenuGrid(key: UniqueKey());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          if (_selectedIndex == 0) const HomeHeader(),
         Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              child: _selectedIndex == 0
                  ? RefreshIndicator(
                      onRefresh: _refresh,
                      child: Transform.translate(
                        offset: const Offset(0, -20), // ✅ aman: hanya menggeser tampilan
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: _pages[0],
                        ),
                      ),
                    )
                  : _pages[1],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'About',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF0099FF),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0099FF), Color(0xFF0088EE)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            children: [
              // Top section with profile and notification
              Row(
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
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pandu ISI Yogyakarta",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Sistem Informasi Terintegrasi",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF42A5F5),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Silakan pilih menu yang Anda butuhkan untuk mengakses layanan.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMenuGrid extends StatefulWidget {
  const _HomeMenuGrid({super.key});

  @override
  State<_HomeMenuGrid> createState() => _HomeMenuGridState();
}

class _HomeMenuGridState extends State<_HomeMenuGrid> {
  final PageController _pageController = PageController(viewportFraction: 0.95);
  int _currentPage = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= promoBanners.length) {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }


  final List<_HomeMenuItem> menuItems = const [
    _HomeMenuItem(Icons.grid_view_rounded, "Layanan", LayananPage(), null, Color(0xFF0099FF)),
    _HomeMenuItem(Icons.gavel_outlined, "Regulasi", null,
        "https://pandu.isi.ac.id/regulasi-dan-rancangan-regulasi/", Color(0xFF00CC88)),
    _HomeMenuItem(Icons.rule_folder_outlined, "SOP", null,
        "https://pandu.isi.ac.id/sop/SOP%20ISI%20Yogyakarta.html", Color(0xFFFF8800)),
    _HomeMenuItem(Icons.info_outline_rounded, "Informasi", InformasiPage(), null, Color(0xFF6699FF)),
    _HomeMenuItem(Icons.poll_outlined, "Survei", SurveiPage(), null, Color(0xFFFF6B9D)),
    _HomeMenuItem(Icons.assignment_outlined, "Permohonan", null, null, Color(0xFF9C27B0)),
  ];

  Future<void> _launchUrl(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal membuka link")),
      );
    }
  }

  final List<Map<String, dynamic>> promoBanners = const [
    {
      'title': 'PAYDAY',
      'subtitle': 'Menangkan hadiah uang tunai',
      'amount': 'Rp 1JT',
      'frequency': 'setiap hari',
      'buttonText': 'SERBU SEKARANG',
      'backgroundColor': Color(0xFF007BFF),
      'accentColor': Colors.amber,
      'icon1': Icons.games,
      'icon2': Icons.play_circle_fill,
      'icon3': Icons.monetization_on,
    },
    {
      'title': 'FLASH SALE',
      'subtitle': 'Dapatkan diskon hingga',
      'amount': '50%',
      'frequency': 'hari ini saja!',
      'buttonText': 'LIHAT PROMO',
      'backgroundColor': Color(0xFFE53935), // Merah
      'accentColor': Colors.yellow,
      'icon1': Icons.flash_on,
      'icon2': Icons.shopping_bag,
      'icon3': Icons.discount,
    },
    {
      'title': 'NEW USER',
      'subtitle': 'Bonus saldo untuk pengguna baru',
      'amount': 'Rp 25K',
      'frequency': 'sekarang!',
      'buttonText': 'DAFTAR SEKARANG',
      'backgroundColor': Color(0xFF43A047), // Hijau
      'accentColor': Colors.lightBlueAccent,
      'icon1': Icons.person_add,
      'icon2': Icons.card_giftcard,
      'icon3': Icons.wallet_giftcard,
    },
    {
    'title': 'AI UPDATE',
    'subtitle': 'Eksplor fitur terbaru AI',
    'amount': 'Gratis',
    'frequency': 'khusus minggu ini',
    'buttonText': 'COBA SEKARANG',
    'backgroundColor': Color(0xFF6A1B9A), // Ungu
    'accentColor': Colors.cyanAccent,
    'icon1': Icons.smart_toy,
    'icon2': Icons.auto_graph,
    'icon3': Icons.lightbulb_outline,
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20), 
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              childAspectRatio: 1.2,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 350 + index * 100),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 0.7 + (value * 0.3),
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: _buildMenuCard(context, item),
              );
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              itemCount: promoBanners.length,
              itemBuilder: (context, index) {
                final bannerData = promoBanners[index];
                return Padding(
                  padding: EdgeInsets.only(right: index == promoBanners.length - 1 ? 0 : 8.0),
                  child: _buildSinglePromoBanner(context, bannerData),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

Widget _buildSinglePromoBanner(BuildContext context, Map<String, dynamic> bannerData) {
    return Container(
      height: 180, //tinggi banner
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bannerData['backgroundColor'],
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Gambar-gambar ikon aplikasi di belakang (sebagai placeholder)
            Positioned(
              right: -20,
              top: -10,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle
                ),
              ),
            ),
             Positioned(
              right: 10,
              bottom: -30,
              child: Icon(bannerData['icon1'], color: Colors.white.withOpacity(0.2), size: 80),
            ),
             Positioned(
              right: 60,
              top: 10,
              child: Icon(bannerData['icon2'], color: Colors.white.withOpacity(0.2), size: 50),
            ),
            Positioned(
              left: -30,
              bottom: -20,
              child: Icon(bannerData['icon3'], color: Colors.white.withOpacity(0.2), size: 100),
            ),

            // Konten utama banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Teks PAYDAY
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: bannerData['accentColor'],
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Text(
                            bannerData['title'],
                            style: const TextStyle(
                              color: Color(0xFF0056B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Teks utama
                        Text(
                          bannerData['subtitle'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Teks harga
                        Text(
                          bannerData['amount'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                          ),
                        ),
                        Text(
                          bannerData['frequency'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tombol Aksi
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bannerData['accentColor'],
                          foregroundColor: const Color(0xFF0056B3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16)
                        ),
                        child: Text(
                          bannerData['buttonText'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, _HomeMenuItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if (item.page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.page!),
            );
          } else if (item.url != null) {
            await _launchUrl(item.url!, context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Fitur ${item.title} belum tersedia",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                backgroundColor: const Color(0xFF2196F3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
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
              const SizedBox(height: 12),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMenuItem {
  final IconData icon;
  final String title;
  final Widget? page;
  final String? url;
  final Color color;

  const _HomeMenuItem(this.icon, this.title, this.page, this.url, this.color);
}