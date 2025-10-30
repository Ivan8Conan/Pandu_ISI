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
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F7FA),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF007BFF).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.info_outline_rounded,
                                size: 32,
                                color: Color(0xFF007BFF),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Permohonan Informasi',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Silakan isi formulir berikut secara lengkap.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Form Fields
                      _buildTextFormField(
                        controller: _namaController,
                        label: 'Nama Lengkap',
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.name],
                      ),
                      const SizedBox(height: 16),

                      _buildDropdownField(
                        label: 'Jenis Pelapor',
                        icon: Icons.business_outlined,
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
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _nikController,
                        label: 'NIK (Nomor Induk Kependudukan)',
                        icon: Icons.credit_card_outlined,
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
                      ),
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email_outlined,
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
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _noteleponController,
                        label: 'No. Telepon',
                        icon: Icons.phone_outlined,
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
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _alamatController,
                        label: 'Alamat Lengkap',
                        icon: Icons.location_on_outlined,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.fullStreetAddress],
                      ),
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _pekerjaanController,
                        label: 'Pekerjaan',
                        icon: Icons.work_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pekerjaan tidak boleh kosong';
                          }
                          return null;
                        },
                        autofillHints: const [AutofillHints.jobTitle],
                      ),
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _informasiController,
                        label: 'Informasi yang Diminta',
                        icon: Icons.description_outlined,
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informasi yang diminta tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildDropdownField(
                        label: 'Kategori Layanan',
                        icon: Icons.category_outlined,
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
                      const SizedBox(height: 16),

                      _buildTextFormField(
                        controller: _tujuanController,
                        label: 'Tujuan Permohonan',
                        icon: Icons.flag_outlined,
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
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF007BFF),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: _isSubmitting
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text('Mengirim...'),
                                  ],
                                )
                              : const Text(
                                  'Submit Permohonan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF6B7280),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF6B7280),
          size: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFF007BFF), width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.white,
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
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF6B7280),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF6B7280),
          size: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xFF007BFF), width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: Colors.white,
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
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_circle, color: Colors.green),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Berhasil!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            content: const Text(
              'Permohonan informasi Anda telah berhasil dikirim. Kami akan memproses permohonan Anda dan memberikan respons dalam waktu yang ditentukan.',
              style: TextStyle(fontSize: 14),
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
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF007BFF),
                ),
                child: const Text('OK'),
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
    _emailController.dispose();
    _noteleponController.dispose();
    _alamatController.dispose();
    _pekerjaanController.dispose();
    _informasiController.dispose();
    _tujuanController.dispose();
    super.dispose();
  }
}