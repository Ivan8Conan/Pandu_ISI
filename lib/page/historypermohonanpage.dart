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

  @override
  Widget build(BuildContext context) {
    final historyList = PermohonanHistoryStore().history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Permohonan Informasi'),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: historyList.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada histori permohonan.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(18),
                itemCount: historyList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = historyList[index];
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.blue.shade100,
                          width: 1.2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade100,
                                  child: const Icon(Icons.person, color: Color(0xFF42A5F5)),
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
                                          fontSize: 18,
                                          color: Color(0xFF1E3A5C),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item.nik,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 15, color: Colors.blue),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${item.waktu.day.toString().padLeft(2, '0')}-${item.waktu.month.toString().padLeft(2, '0')}-${item.waktu.year} "
                                        "${item.waktu.hour.toString().padLeft(2, '0')}:${item.waktu.minute.toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Info Row
                            Row(
                              children: [
                                _infoChip(Icons.business, item.jenisPelapor),
                                const SizedBox(width: 4),
                                _infoChip(Icons.category, item.kategori),
                                const SizedBox(width: 4),
                                _infoChip(Icons.work, item.pekerjaan),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 18, color: Colors.blueGrey),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    item.alamat,
                                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 28, thickness: 1.1),
                            // Informasi Diminta
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.info_outline, color: Color(0xFF42A5F5), size: 20),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Informasi Diminta",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item.informasi,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.flag, color: Color(0xFF42A5F5), size: 20),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tujuan Permohonan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item.tujuan,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 15, color: Colors.blue),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}