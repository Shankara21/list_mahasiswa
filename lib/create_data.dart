import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_sqflite/database_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  MaterialStatesController fotoController = MaterialStatesController();
  late File image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        // await _picker.pickImage(source: ImageSource.camera);
        await _picker.pickImage(source: ImageSource.camera);
      image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    databaseInstance.database();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff041C32),
        centerTitle: true,
        title: Text('Tambah Data'),
      ),
      body: Container(
        color: Color(0xff04293A),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Nama',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.poppins(fontSize: 18),
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'NIM',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.poppins(fontSize: 18),
              controller: nimController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'NIM',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Alamat',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.poppins(fontSize: 18),
              controller: alamatController,
              decoration: InputDecoration(
                hintText: 'Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No.Hp',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.poppins(fontSize: 18),
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'No.Hp',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Jenis Kelamin',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              style: GoogleFonts.poppins(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Jenis Kelamin',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Laki-laki',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  value: 'Laki-laki',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Perempuan',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  value: 'Perempuan',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  jenisKelaminController.text = value.toString();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   controller: imageController,
            //   decoration: InputDecoration(
            //     labelText: 'Image',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
// button untuk memilih gambar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                primary: Color(0xff064663),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                getImage();
              },
              child: Text(
                'Upload Gambar',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                primary: Color(0xff064663),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                databaseInstance.insert({
                  'name': nameController.text,
                  'nim': nimController.text,
                  'alamat': alamatController.text,
                  'phone': phoneController.text,
                  'jenis_kelamin': jenisKelaminController.text,
                  'image': image.path,
                });
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
