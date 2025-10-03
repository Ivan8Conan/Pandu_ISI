import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDatabasePage extends StatefulWidget {
  const ApiDatabasePage({super.key});

  @override
  State<ApiDatabasePage> createState() => _ApiDatabasePageState();
}

class _ApiDatabasePageState extends State<ApiDatabasePage> {
  final String baseUrl = "http://192.168.7.232/pandu_isi";

  Map<String, List<dynamic>> dataTables = {};
  bool isLoading = true;
  String errorMessage = '';

  final List<Map<String, String>> tables = [
    {"name": "User", "endpoint": "get_users.php"},
    {"name": "Jenis Pelapor", "endpoint": "get_jenis_pelapor.php"},
    {"name": "Kategori", "endpoint": "get_kategori.php"},
    {"name": "Pelapor", "endpoint": "get_pelapor.php"},
    {"name": "Log Status", "endpoint": "get_log_status.php"},
  ];

  @override
  void initState() {
    super.initState();
    fetchAllTables();
  }

  Future<void> fetchAllTables() async {
    try {
      for (var table in tables) {
        final url = Uri.parse('$baseUrl/${table["endpoint"]}');
        print('Fetching: $url');  // Debug log
        final response = await http.get(url);
        print('Response status: ${response.statusCode}');
        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          print('Data received: $jsonData');
          dataTables[table["name"]!] = jsonData;
        } else {
          throw Exception('Failed to load ${table["name"]} with status ${response.statusCode}');
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Widget buildTable(String title, List<dynamic> data) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF1565C0),
            ),
          ),
          children: data.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: item.entries.map<Widget>((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${e.key}: ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${e.value}",
                            style: const TextStyle(color: Colors.black54),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Semua Tabel'),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: dataTables.entries
                      .map((entry) => buildTable(entry.key, entry.value))
                      .toList(),
                ),
    );
  }
}