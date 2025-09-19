import 'package:flutter/material.dart';

class PermohonanHistory {
  final String nama;
  final String nik;
  final String alamat;
  final String pekerjaan;
  final String informasi;
  final String tujuan;
  final String jenisPelapor;
  final String kategori;
  final DateTime waktu;

  PermohonanHistory({
    required this.nama,
    required this.nik,
    required this.alamat,
    required this.pekerjaan,
    required this.informasi,
    required this.tujuan,
    required this.jenisPelapor,
    required this.kategori,
    required this.waktu,
  });
}

class PermohonanHistoryStore {
  static final PermohonanHistoryStore _instance = PermohonanHistoryStore._internal();
  factory PermohonanHistoryStore() => _instance;
  PermohonanHistoryStore._internal();

  final List<PermohonanHistory> _history = [];

  List<PermohonanHistory> get history => List.unmodifiable(_history);

  void add(PermohonanHistory data) {
    _history.insert(0, data);
  }
}

class PermohonanHistoryPage extends StatelessWidget {
  const PermohonanHistoryPage({super.key});

  IconData _getKategoriIcon(String kategori) {
    switch (kategori) {
      case "Layanan Umum":
        return Icons.public;
      case "Layanan Pendidikan":
        return Icons.school;
      case "Layanan Kepegawaian":
        return Icons.work;
      case "Layanan Penelitian":
        return Icons.science;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyList = PermohonanHistoryStore().history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Permohonan Informasi'),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 2,
      ),
      body: historyList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada histori permohonan.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: historyList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = historyList[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PermohonanDetailPage(item: item),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(
                            _getKategoriIcon(item.kategori),
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF1E3A5C),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.kategori,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${item.waktu.day.toString().padLeft(2, '0')}-${item.waktu.month.toString().padLeft(2, '0')}-${item.waktu.year} "
                                "${item.waktu.hour.toString().padLeft(2, '0')}:${item.waktu.minute.toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.blue.shade400),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PermohonanDetailPage extends StatelessWidget {
  final PermohonanHistory item;
  const PermohonanDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Permohonan"),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _detailCard(Icons.person, "Nama", item.nama),
            _detailCard(Icons.credit_card, "NIK", item.nik),
            _detailCard(Icons.home, "Alamat", item.alamat),
            _detailCard(Icons.work, "Pekerjaan", item.pekerjaan),
            _detailCard(Icons.group, "Jenis Pelapor", item.jenisPelapor),
            _detailCard(Icons.category, "Kategori", item.kategori),
            _detailCard(Icons.info, "Informasi Diminta", item.informasi),
            _detailCard(Icons.flag, "Tujuan Permohonan", item.tujuan),
            _detailCard(Icons.access_time, "Waktu",
                "${item.waktu.day}-${item.waktu.month}-${item.waktu.year} ${item.waktu.hour}:${item.waktu.minute}"),
          ],
        ),
      ),
    );
  }

  Widget _detailCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blue)),
                  const SizedBox(height: 4),
                  Text(value,
                      style: const TextStyle(fontSize: 14, color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}