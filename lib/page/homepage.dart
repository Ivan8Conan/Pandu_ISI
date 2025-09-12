import 'package:flutter/material.dart';
import 'layananpage.dart';
import 'tentangpage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _HomeMenuGrid(),
    TentangPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/LOGO-ISI.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Pandu ISI Yogyakarta",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
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
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'Tentang',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF42A5F5),
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

class _HomeMenuGrid extends StatelessWidget {
  const _HomeMenuGrid();

  final List<_HomeMenuItem> menuItems = const [
    _HomeMenuItem(Icons.grid_view_rounded, "Layanan", LayananPage()),
    _HomeMenuItem(Icons.gavel_outlined, "Regulasi", null),
    _HomeMenuItem(Icons.rule_folder_outlined, "SOP", null),
    _HomeMenuItem(Icons.info_outline_rounded, "Informasi", null),
    _HomeMenuItem(Icons.poll_outlined, "Survei", null),
    _HomeMenuItem(Icons.assignment_outlined, "Laporan", null),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
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
                  'Silakan pilih menu yang Anda butuhkan.',
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
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildMenuCard(context, item);
          },
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, _HomeMenuItem item) {
    return InkWell(
      onTap: () {
        if (item.page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => item.page!),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${item.title} belum tersedia")),
          );
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF42A5F5).withOpacity(0.18),
            width: 1.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 30, color: const Color(0xFF42A5F5)),
            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeMenuItem {
  final IconData icon;
  final String title;
  final Widget? page;

  const _HomeMenuItem(this.icon, this.title, this.page);
}