// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const PanduISIApp());
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const MainScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color(0xFF42A5F5),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage('assets/images/LOGO-ISI.png'),
//               backgroundColor: Colors.white,
//             ),
//             SizedBox(height: 24),
//             Text(
//               'Pandu ISI',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 2,
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'Institut Seni Indonesia Yogyakarta',
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 40),
//             CircularProgressIndicator(
//               color: Colors.white,
//               strokeWidth: 3,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PanduISIApp extends StatelessWidget {
//   const PanduISIApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//     ));

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pandu ISI Yogyakarta',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: const Color(0xFFF5F7FA),
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           primary: const Color(0xFF42A5F5),
//           secondary: const Color(0xFFF9A825),
//         ),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: false,
//           titleTextStyle: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       home: const SplashScreen(),
//       onGenerateRoute: (settings) => PageRouteBuilder(
//         pageBuilder: (_, __, ___) => const MainScreen(),
//         transitionsBuilder: (_, anim, __, child) =>
//             FadeTransition(opacity: anim, child: child),
//       ),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     LayananScreen(),
//     TentangScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.blueAccent.withOpacity(0.08),
//               blurRadius: 12,
//               offset: const Offset(0, -2),
//             ),
//           ],
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         child: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.grid_view_rounded),
//               label: 'Layanan',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.info_outline_rounded),
//               label: 'Tentang',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: const Color(0xFF42A5F5),
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//       ),
//     );
//   }
// }

// class ServiceItem {
//   final IconData icon;
//   final String title;
//   final String url;
//   const ServiceItem({required this.icon, required this.title, required this.url});
// }

// class LayananScreen extends StatefulWidget {
//   const LayananScreen({super.key});

//   @override
//   State<LayananScreen> createState() => _LayananScreenState();
// }
// enum LayananKategori { all, pendidikan, kemahasiswaan, perpustakaan }

// class _LayananScreenState extends State<LayananScreen> {
//   static const List<ServiceItem> layananPendidikan = [
//     ServiceItem(icon: Icons.school_outlined, title: 'KRS Online', url: 'https://siak.isi.ac.id/'),
//     ServiceItem(icon: Icons.person_add_alt_1_outlined, title: 'e-Admisi PMB', url: 'https://espmi.isi.ac.id/'),
//     ServiceItem(icon: Icons.cast_for_education_outlined, title: 'e-Learning', url: 'https://elearning.isi.ac.id/'),
//     ServiceItem(icon: Icons.workspace_premium_outlined, title: 'Wisuda', url: 'https://wisuda.isi.ac.id/'),
//     ServiceItem(icon: Icons.document_scanner_outlined, title: 'e-SMPI', url: 'https://espmi.isi.ac.id/'),
//     ServiceItem(icon: Icons.class_outlined, title: 'Open Class', url: 'https://openclass.isi.ac.id/'),
//   ];

//   static const List<ServiceItem> layananMahasiswa = [
//     ServiceItem(icon: Icons.savings_outlined, title: 'Beasiswa', url: 'https://www.isi.ac.id/pendidikan/student-services/scholarship/'),
//     ServiceItem(icon: Icons.work_outline, title: 'Karir dan Kewirausahaan', url: 'https://ppkk.isi.ac.id/'),
//     ServiceItem(icon: Icons.emoji_events_outlined, title: 'Prestasi Mahasiswa', url: 'https://www.isi.ac.id/pendidikan/student-services/student-achievement/'),
//     ServiceItem(icon: Icons.groups_outlined, title: 'Organisasi Kemahasiswaan', url: 'https://www.isi.ac.id/pendidikan/student-services/student-organizations/'),
//     ServiceItem(icon: Icons.people_alt_outlined, title: 'Alumni', url: 'https://www.isi.ac.id/pendidikan/student-services/alumni/'),
//     ServiceItem(icon: Icons.analytics_outlined, title: 'Tracer Study', url: 'https://tracerstudy.kemdikbud.go.id/'),
//   ];

//   static const List<ServiceItem> layananPerpustakaan = [
//     ServiceItem(icon: Icons.article_outlined, title: 'e-Journal', url: 'https://journal.isi.ac.id/'),
//     ServiceItem(icon: Icons.folder_zip_outlined, title: 'DIGILIB Repository', url: 'https://digilib.isi.ac.id/'),
//     ServiceItem(icon: Icons.menu_book_outlined, title: 'OPAC', url: 'https://opac.isi.ac.id/#gsc.tab=0'),
//   ];

//   final TextEditingController _searchController = TextEditingController();
//   LayananKategori _selectedKategori = LayananKategori.all;
//   List<ServiceItem> _filteredList = [];
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _filteredList = _getListByKategori(_selectedKategori);
//   }

//   List<ServiceItem> _getListByKategori(LayananKategori kategori) {
//     switch (kategori) {
//       case LayananKategori.pendidikan:
//         return layananPendidikan;
//       case LayananKategori.kemahasiswaan:
//         return layananMahasiswa;
//       case LayananKategori.perpustakaan:
//         return layananPerpustakaan;
//       case LayananKategori.all:
//       return [
//           ...layananPendidikan,
//           ...layananMahasiswa,
//           ...layananPerpustakaan,
//         ];
//     }
//   }

//   void _onKategoriChanged(LayananKategori? kategori) {
//     if (kategori == null) return;
//     _searchController.clear();
//     setState(() {
//       _selectedKategori = kategori;
//       _filteredList = _getListByKategori(kategori);
//     });
//   }

//   void _onSearch(String query) {
//     final list = _getListByKategori(_selectedKategori);
//     setState(() {
//       _filteredList = list
//           .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   Future<void> _onRefresh() async {
//     setState(() => _isLoading = true);
//     await Future.delayed(const Duration(seconds: 1));
//     setState(() {
//       _isLoading = false;
//       _filteredList = _getListByKategori(_selectedKategori);
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       color: const Color(0xFF42A5F5),
//       backgroundColor: Colors.white,
//       strokeWidth: 2.5,
//       onRefresh: _onRefresh,
//       child: CustomScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             floating: false,
//             expandedHeight: 100.0,
//             backgroundColor: const Color(0xFF42A5F5),
//             elevation: 0,
//             systemOverlayStyle: SystemUiOverlayStyle.dark,
//             flexibleSpace: FlexibleSpaceBar(
//               titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               centerTitle: false,
//               title: const Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 16,
//                     backgroundImage: AssetImage('assets/images/LOGO-ISI.png'),
//                     backgroundColor: Colors.white,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     'Pandu ISI Yogyakarta',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                 ],
//               ),
//               background: Container(
//                 color: const Color(0xFF42A5F5),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Column(
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//                     color: Colors.white,
//                     shadowColor: const Color(0xFF42A5F5).withOpacity(0.08),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Selamat Datang!',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF42A5F5),
//                               letterSpacing: 1,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(
//                             'Silakan pilih layanan yang Anda butuhkan.',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.grey[800],
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   // Search Bar + Filter (Dropdown) in one row
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         color: const Color(0xFF42A5F5).withOpacity(0.18),
//                         width: 1.2,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: _searchController,
//                             onChanged: _onSearch,
//                             decoration: const InputDecoration(
//                               hintText: 'Cari layanan...',
//                               prefixIcon: Icon(Icons.search, color: Color(0xFF42A5F5)),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(vertical: 14),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 48,
//                           padding: const EdgeInsets.only(right: 8),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<LayananKategori>(
//                               value: _selectedKategori,
//                               icon: const Icon(Icons.filter_list, color: Color(0xFF42A5F5)),
//                               style: const TextStyle(
//                                 color: Color(0xFF42A5F5),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                               items: const [
//                                 DropdownMenuItem(
//                                   value: LayananKategori.all,
//                                   child: Text('Semua'),
//                                 ),
//                                 DropdownMenuItem(
//                                   value: LayananKategori.pendidikan,
//                                   child: Text('Pendidikan'),
//                                 ),
//                                 DropdownMenuItem(
//                                   value: LayananKategori.kemahasiswaan,
//                                   child: Text('Kemahasiswaan'),
//                                 ),
//                                 DropdownMenuItem(
//                                   value: LayananKategori.perpustakaan,
//                                   child: Text('Perpustakaan'),
//                                 ),
//                               ],
//                               onChanged: _onKategoriChanged,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (_isLoading)
//             const SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 32),
//                 child: Center(
//                   child: AnimatedLoadingIndicator(),
//                 ),
//               ),
//             )
//           else
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: _filteredList.isEmpty
//                     ? const Center(
//                         child: Text(
//                           'Tidak ditemukan layanan.',
//                           style: TextStyle(color: Colors.grey, fontSize: 16),
//                         ),
//                       )
//                     : GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 12,
//                           mainAxisSpacing: 12,
//                           childAspectRatio: 0.9,
//                         ),
//                         itemCount: _filteredList.length,
//                         itemBuilder: (context, index) {
//                           return _buildServiceCard(context, _filteredList[index]);
//                         },
//                       ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildServiceCard(BuildContext context, ServiceItem item) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.97, end: 1.0),
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//       builder: (context, scale, child) {
//         return Transform.scale(
//           scale: scale,
//           child: child,
//         );
//       },
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () async {
//             final Uri url = Uri.parse(item.url);
//             try {
//               final bool launched = await launchUrl(
//                 url,
//                 mode: LaunchMode.externalApplication,
//               );
//               if (!launched) {
//                 await launchUrl(url, mode: LaunchMode.inAppWebView);
//               }
//             } catch (e) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Tidak bisa membuka ${item.title}: $e')),
//               );
//             }
//           },
//           borderRadius: BorderRadius.circular(16),
//           splashColor: const Color(0xFF42A5F5).withOpacity(0.10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(
//                 color: const Color(0xFF42A5F5).withOpacity(0.18),
//                 width: 1.2,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xFF42A5F5).withOpacity(0.07),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF42A5F5),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     item.icon,
//                     size: 22,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   item.title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 13,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AnimatedLoadingIndicator extends StatefulWidget {
//   const AnimatedLoadingIndicator({super.key});

//   @override
//   State<AnimatedLoadingIndicator> createState() => _AnimatedLoadingIndicatorState();
// }

// class _AnimatedLoadingIndicatorState extends State<AnimatedLoadingIndicator>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat();
//     _animation = Tween<double>(begin: 0.7, end: 1.2).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _animation,
//       child: Container(
//         width: 38,
//         height: 38,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: LinearGradient(
//             colors: [Color(0xFF42A5F5), Color(0xFF90CAF9)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 3,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TentangScreen extends StatelessWidget {
//   const TentangScreen({super.key});

//   static const List<Map<String, dynamic>> aboutItems = [
//     {'title': 'Profil ISI', 'icon': Icons.account_balance_outlined},
//     {'title': 'Visi & Misi', 'icon': Icons.visibility_outlined},
//     {'title': 'Struktur Organisasi', 'icon': Icons.device_hub_outlined},
//     {'title': 'Statuta', 'icon': Icons.gavel_outlined},
//     {'title': 'Renstra', 'icon': Icons.assessment_outlined},
//     {'title': 'OTK', 'icon': Icons.architecture_outlined},
//     {'title': 'Perjanjian Kinerja Rektor', 'icon': Icons.assignment_turned_in_outlined},
//     {'title': 'Laporan Kinerja', 'icon': Icons.receipt_long_outlined},
//   ];

//   Future<void> _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw Exception('Tidak bisa membuka $url');
//     }
//   }


//   Future<void> _onRefresh() async {
//     await Future.delayed(const Duration(seconds: 1));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: RefreshIndicator(
//         color: const Color(0xFF42A5F5),
//         backgroundColor: Colors.white,
//         strokeWidth: 2.5,
//         onRefresh: _onRefresh,
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.only(top: 48, bottom: 24, left: 24, right: 24),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF42A5F5),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF42A5F5),
//                     blurRadius: 12,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: const Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 28,
//                     backgroundImage: AssetImage('assets/images/LOGO-ISI.png'),
//                     backgroundColor: Colors.white,
//                   ),
//                   SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Tentang ISI Yogyakarta',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Institut Seni Indonesia Yogyakarta',
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.separated(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 itemCount: aboutItems.length,
//                 separatorBuilder: (context, index) => const SizedBox(height: 10),
//                 itemBuilder: (context, index) {
//                   final item = aboutItems[index];
//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//                     color: Colors.white,
//                     shadowColor: const Color(0xFF42A5F5).withOpacity(0.08),
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(18),
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                           ),
//                           backgroundColor: Colors.white,
//                           isScrollControlled: true,
//                           builder: (context) {
//                             String title = item['title'];
//                             Widget detailWidget;

//                             Widget closeButton = Positioned(
//                               right: 0,
//                               top: 0,
//                               child: IconButton(
//                                 icon: const Icon(Icons.close, color: Colors.grey, size: 28),
//                                 onPressed: () => Navigator.of(context).pop(),
//                                 tooltip: 'Tutup',
//                               ),
//                             );
//                             if (title == 'Profil ISI') {
//                               detailWidget = Stack(
//                                 children: [
//                                   SingleChildScrollView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(24.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                               width: 40,
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey[300],
//                                                 borderRadius: BorderRadius.circular(2),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Profil ISI Yogyakarta',
//                                             style: TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                               letterSpacing: 1,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             'Institut Seni Indonesia Yogyakarta',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.black87,
//                                             ),
//                                           ),
//                                           const Divider(height: 28, thickness: 1),
//                                           const Text(
//                                             'Institut Seni Indonesia Yogyakarta yang berdiri sejak 23 Juli 1984 adalah sebuah lembaga pendidikan tinggi seni dengan status negeri penuh di bawah Kementerian Riset, Teknologi, dan Pendidikan Tinggi Republik Indonesia. ISI Yogyakarta menyelenggarakan pendidikan Diploma, S1, S2 hingga S3 dengan berbagai bidang seni terlengkap dan terbaik di Indonesia.',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Sejarah',
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             'ISI Yogyakarta dibentuk atas dasar Keputusan Presiden RI No. 39/1984 tanggal 30 Mei 1984 dan diresmikan oleh Menteri Pendidikan dan Kebudayaan Prof. Dr. Nugroho Notosusanto pada tanggal 23 Juli 1984. ISI Yogyakarta dibentuk berdasarkan fusi atas tiga pendidikan tinggi seni yang sudah ada sebelumnya, yaitu Sekolah Tinggi Seni Rupa Indonesia “ASRI”, Akademi Musik Indonesia “AMI”, dan Akademi Seni Tari Indonesia “ASTI”.',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Ruang Lingkup',
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             'ISI Yogyakarta adalah perguruan tinggi negeri yang menyelenggarakan pendidikan akademik dalam kelompok disiplin ilmu pengetahuan di bidang seni dan jika memenuhi syarat dapat menyelenggarakan pendidikan akademik, profesi, dan vokasi sesuai dengan ketentuan Peraturan Perundang-undangan.',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   closeButton,
//                                 ],
//                               );
//                             } else if (title == 'Visi & Misi') {
//                               detailWidget = Stack(
//                                 children: [
//                                   SingleChildScrollView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(24.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                               width: 40,
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey[300],
//                                                 borderRadius: BorderRadius.circular(2),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Visi & Misi',
//                                             style: TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                               letterSpacing: 1,
//                                             ),
//                                           ),
//                                           const Divider(height: 28, thickness: 1),
//                                           const Text(
//                                             'Visi:',
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             'Institut Seni Indonesia Yogyakarta menjadi pelopor perguruan tinggi seni nasional yang unggul, kreatif, dan inovatif berdasar Pancasila.',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Misi:',
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             '1. Menyelenggarakan pendidikan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
//                                             '2. Menyelenggarakan penelitian dan penciptaan seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
//                                             '3. Menyelenggarakan pengabdian kepada masyarakat dalam bidang seni yang unggul, kreatif, dan inovatif berdasarkan Pancasila.\n'
//                                             '4. Menyelenggarakan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan.\n'
//                                             '5. Menyelenggarakan manajemen yang efektif, efisien, transparan, dan akuntabel (good governance).',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Tujuan:',
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           const Text(
//                                             '1. Mewujudkan pendidikan seni yang menghasilkan sarjana dan ahli seni yang kreatif, produktif, inovatif, dan kompetitif.\n'
//                                             '2. Mewujudkan penelitian dan penciptaan seni yang unggul, inovatif, berwawasan lingkungan, dan berbasis pada kearifan lokal.\n'
//                                             '3. Mewujudkan dharma pengabdian kepada masyarakat secara berkelanjutan yang mampu meningkatkan kemandirian dan daya saing bangsa untuk kesejahteraan masyarakat.\n'
//                                             '4. Mewujudkan kerjasama nasional, regional, dan internasional yang strategis, sinergis, dan berkelanjutan yang menghasilkan academic benefit.\n'
//                                             '5. Mewujudkan pengelolaan lembaga yang efektif, efisien, transparan, dan akuntabel (good governance).',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   closeButton,
//                                 ],
//                               );
//                             } else if (title == 'Struktur Organisasi') {
//                               detailWidget = Stack(
//                                 children: [
//                                   SingleChildScrollView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(24.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                               width: 40,
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey[300],
//                                                 borderRadius: BorderRadius.circular(2),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Struktur Organisasi',
//                                             style: TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                               letterSpacing: 1,
//                                             ),
//                                           ),
//                                           const Divider(height: 28, thickness: 1),
//                                           const Text(
//                                             'Struktur organisasi ISI Yogyakarta terdiri dari Rektor, Wakil Rektor, Dekan, Ketua Jurusan, dan unit-unit pendukung lainnya. Berikut adalah beberapa nama pejabat utama:',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           const Text(
//                                             'Rektor: Dr. Irwandi, S.Sn., M.Sn\n'
//                                             'Wakil Rektor Bidang Akademik dan Perencanaan: Dr. Dewanto Sukistono, M.Sn\n'
//                                             'Wakil Rektor Bidang Keuangan dan Umum: Dr. Suryati, M.Hum\n'
//                                             'Wakil Rektor Bidang Kemahasiswaan, Kerja Sama, dan Alumni: Dr. M. Kholid Arif Rozaq, S.Hut., M.M\n\n'
//                                             'Dekan Fakultas Seni Rupa dan Desain: Muhamad Sholahuddin, S.Sn., M.T\n'
//                                             'Dekan Fakultas Seni Pertunjukan: Dr. I Nyoman Cau Arsana, S.Sn., M.Hum\n'
//                                             'Dekan Fakultas Seni Media Rekam: Dr. Edial Rusli, SE., M.Sn\n'
//                                             'Direktur Program Pascasarjana: Dr. Fortunata Tyasrinestu, S.S., M.Si\n\n'
//                                             'Struktur lengkap dapat dilihat pada website resmi ISI Yogyakarta.',
//                                             style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   closeButton,
//                                 ],
//                               );
//                             } else {
//                               String sectionTitle = title;
//                               String sectionContent = '';
//                               String? linkUrl;

//                               if (title == 'Statuta') {
//                                 sectionContent = 'Informasi detail mengenai Statuta ISI Yogyakarta dapat diakses melalui tautan berikut.';
//                                 linkUrl = 'https://pandu.isi.ac.id/statuta/';
//                               } else if (title == 'Renstra') {
//                                 sectionContent = 'Informasi detail mengenai Renstra ISI Yogyakarta dapat diakses melalui tautan berikut.';
//                                 linkUrl = 'https://pandu.isi.ac.id/renstra/';
//                               } else if (title == 'OTK') {
//                                 sectionContent = 'Informasi detail mengenai OTK ISI Yogyakarta dapat diakses melalui tautan berikut.';
//                                 linkUrl = 'https://pandu.isi.ac.id/otk/';
//                               } else if (title == 'Perjanjian Kinerja Rektor') {
//                                 sectionContent = 'Informasi detail mengenai Perjanjian Kinerja Rektor ISI Yogyakarta dapat diakses melalui tautan berikut.';
//                                 linkUrl = 'https://pandu.isi.ac.id/pk-rektor/';
//                               } else if (title == 'Laporan Kinerja') {
//                                 sectionContent = 'Informasi detail mengenai Laporan Kinerja ISI Yogyakarta dapat diakses melalui tautan berikut.';
//                                 linkUrl = 'https://pandu.isi.ac.id/laporan-kinerja/';
//                               }
//                               detailWidget = Stack(
//                                 children: [
//                                   SingleChildScrollView(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(24.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                               width: 40,
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey[300],
//                                                 borderRadius: BorderRadius.circular(2),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 16),
//                                           Text(
//                                             sectionTitle,
//                                             style: const TextStyle(
//                                               fontSize: 22,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF42A5F5),
//                                               letterSpacing: 1,
//                                             ),
//                                           ),
//                                           const Divider(height: 28, thickness: 1),
//                                           Text(
//                                             sectionContent,
//                                             style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
//                                           ),
//                                           if (linkUrl != null) ...[
//                                             const SizedBox(height: 16),
//                                             GestureDetector(
//                                               onTap: () => _launchURL(linkUrl!),
//                                               child: Text(
//                                                 '🔗 Lihat Detail $sectionTitle',
//                                                 style: const TextStyle(
//                                                   color: Color(0xFF42A5F5),
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600,
//                                                   decoration: TextDecoration.underline,
//                                                 ),
//                                               ),
//                                             ),
//                                           ]
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   closeButton,
//                                 ],
//                               );
//                             }
//                             return detailWidget;
//                           },
//                         );
//                       },
//                       child: ListTile(
//                         leading: Icon(item['icon'], color: const Color(0xFF42A5F5), size: 28),
//                         title: Text(
//                           item['title'],
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16,
//                             color: Colors.black,
//                           ),
//                         ),
//                         trailing: const Icon(Icons.chevron_right, color: Colors.grey),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }