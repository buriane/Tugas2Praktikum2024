import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              "Input Data",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 100,
      ),
      body: Container(
        
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _textboxNama(),
            _textboxNIM(),
            _textboxTahun(),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

Widget _textboxNama() {
  return TextField(
    cursorColor: Colors.white,
    controller: _namaController,
    style: const TextStyle(color: Colors.white), 
    decoration: const InputDecoration(
      labelText: "Nama",
      labelStyle: TextStyle(color: Colors.white70), 
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white54), 
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), 
      ),
    ),
  );
}

Widget _textboxNIM() {
  return TextField(
    cursorColor: Colors.white,
    controller: _nimController,
    style: const TextStyle(color: Colors.white), 
    decoration: const InputDecoration(
      labelText: "NIM",
      labelStyle: TextStyle(color: Colors.white70), 
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white54), 
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), 
      ),
    ),
  );
}

Widget _textboxTahun() {
  return TextField(
    cursorColor: Colors.white,
    controller: _tahunController,
    style: const TextStyle(color: Colors.white), 
    decoration: const InputDecoration(
      labelText: "Tahun",
      labelStyle: TextStyle(color: Colors.white70), 
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white54), 
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), 
      ),
    ),
  );
}

_tombolSimpan() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: _isLoading ? null : () async {
          setState(() {
            _isLoading = true;
          });

          await Future.delayed(const Duration(milliseconds: 1000));

          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun)));

          setState(() {
            _isLoading = false;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF84F66),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
    );
  }
}
