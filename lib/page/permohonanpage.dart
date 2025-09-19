import 'package:flutter/material.dart';
import 'historypermohonanpage.dart';

class PermohonanInformasiPage extends StatefulWidget {
  const PermohonanInformasiPage({super.key});

  @override
  _PermohonanInformasiPageState createState() => _PermohonanInformasiPageState();
}

class _PermohonanInformasiPageState extends State<PermohonanInformasiPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _emailController = TextEditingController();
  final _noteleponController = TextEditingController();
  final _alamatController = TextEditingController();
  final _pekerjaanController = TextEditingController();
  final _informasiController = TextEditingController();
  final _tujuanController = TextEditingController();

  bool _isSubmitting = false;

  String? _selectedJenisPelapor;
  String? _selectedKategori;

  final List<String> _jenisPelaporList = [
    'Perorangan',
    'Badan Hukum'
  ];

  final List<String> _kategoriList = [
    'Layanan Umum',
    'Layanan Pendidikan',
    'Layanan Kemahasiswaan',
    'Layanan Kepegawaian',
    'Layanan Penelitian',
    'Layanan Pengadaan',
    'Penerimaan Mahasiswa Baru'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Permohonan Informasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF42A5F5).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: const Icon(
                                Icons.info_outline,
                                size: 48,
                                color: Color(0xFF42A5F5),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Permohonan Informasi',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF42A5F5),
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Silakan isi form berikut dengan lengkap',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildTextFormField(
                        controller: _namaController,
                        label: 'Nama Lengkap',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.name],
                      ),
                      const SizedBox(height: 18),
                      _buildDropdownField(
                        label: 'Jenis Pelapor',
                        icon: Icons.business,
                        value: _selectedJenisPelapor,
                        items: _jenisPelaporList,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedJenisPelapor = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih jenis pelapor';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _nikController,
                        label: 'NIK (Nomor Induk Kependudukan)',
                        icon: Icons.credit_card,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'NIK tidak boleh kosong';
                          }
                          if (value.length != 16) {
                            return 'NIK harus 16 digit';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.telephoneNumber],
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.email],
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _noteleponController,
                        label: 'No. Telepon',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor telepon tidak boleh kosong';
                          }
                          if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                            return 'Nomor telepon harus 10-15 digit angka';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.telephoneNumber],
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _alamatController,
                        label: 'Alamat Lengkap',
                        icon: Icons.location_on,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.fullStreetAddress],
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _pekerjaanController,
                        label: 'Pekerjaan',
                        icon: Icons.work,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pekerjaan tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.jobTitle],
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _informasiController,
                        label: 'Informasi yang Diminta',
                        icon: Icons.description,
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informasi yang diminta tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      _buildDropdownField(
                        label: 'Kategori Layanan',
                        icon: Icons.category,
                        value: _selectedKategori,
                        items: _kategoriList,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedKategori = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih kategori layanan';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      _buildTextFormField(
                        controller: _tujuanController,
                        label: 'Tujuan Permohonan',
                        icon: Icons.flag,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tujuan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 6,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          icon: _isSubmitting
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    strokeWidth: 3,
                                  ),
                                )
                              : const Icon(Icons.send, size: 24),
                          label: Text(
                            _isSubmitting ? 'Mengirim...' : 'Submit Permohonan',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
    List<String>? autofillHints,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      autofillHints: autofillHints,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue.shade700,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.blue.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue.shade700,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.blue.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      await Future.delayed(const Duration(seconds: 2)); // Simulate network

      setState(() {
        _isSubmitting = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 32),
                SizedBox(width: 12),
                Text(
                  'Berhasil!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: const Text(
              'Permohonan informasi Anda telah berhasil dikirim. Kami akan memproses permohonan Anda dan memberikan respons dalam waktu yang ditentukan.',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  PermohonanHistoryStore().add(
                  PermohonanHistory(
                    nama: _namaController.text,
                    nik: _nikController.text,
                    alamat: _alamatController.text,
                    pekerjaan: _pekerjaanController.text,
                    informasi: _informasiController.text,
                    tujuan: _tujuanController.text,
                    jenisPelapor: _selectedJenisPelapor ?? '',
                    kategori: _selectedKategori ?? '',
                    waktu: DateTime.now(),
                  ),
                );
                  Navigator.of(context).pop();
                  _resetForm();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _nikController.clear();
    _emailController.clear();
    _noteleponController.clear();
    _alamatController.clear();
    _pekerjaanController.clear();
    _informasiController.clear();
    _tujuanController.clear();
    setState(() {
      _selectedJenisPelapor = null;
      _selectedKategori = null;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nikController.dispose();
    _alamatController.dispose();
    _pekerjaanController.dispose();
    _informasiController.dispose();
    _tujuanController.dispose();
    super.dispose();
  }
}