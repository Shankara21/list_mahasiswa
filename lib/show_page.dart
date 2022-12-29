import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mahasiswa_model.dart';

class DetailMahasiswa extends StatefulWidget {
  final MahasiswaModel? mahasiswaModel;
  const DetailMahasiswa({super.key, required this.mahasiswaModel});

  @override
  State<DetailMahasiswa> createState() => _DetailMahasiswaState();
}

class _DetailMahasiswaState extends State<DetailMahasiswa> {
  @override
  Widget build(BuildContext context) {
    final jk = widget.mahasiswaModel!.jenisKelamin;
    print('jenis kelamin: $jk');
    return Scaffold(
      // Membuat tampilan detail mahasiswa
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
        centerTitle: true,
        backgroundColor: Color(0xff041C32),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xff04293A),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              jk == 'Laki-laki' ? 'assets/man.png' : 'assets/woman.png',
              width: 150,
            ),
            // Image.file(
            //   File(widget.mahasiswaModel!.image!),
            //   width: 150,
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nama: ${widget.mahasiswaModel!.name}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'NIM: ${widget.mahasiswaModel!.nim}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Alamat: ${widget.mahasiswaModel!.alamat}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone: ${widget.mahasiswaModel!.phone}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Jenis Kelamin: ${widget.mahasiswaModel!.jenisKelamin}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
