import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_sqflite/database_instance.dart';
import 'package:uas_sqflite/mahasiswa_model.dart';

class UpdatePage extends StatefulWidget {
  final MahasiswaModel? mahasiswaModel;
  const UpdatePage({super.key, required this.mahasiswaModel});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();

  @override
  void initState() {
    print(widget.mahasiswaModel!.id!);
    super.initState();
    nameController.text = widget.mahasiswaModel!.name ?? '';
    nimController.text = widget.mahasiswaModel!.nim ?? '';
    alamatController.text = widget.mahasiswaModel!.alamat ?? '';
    phoneController.text = widget.mahasiswaModel!.phone ?? '';
    jenisKelaminController.text = widget.mahasiswaModel!.jenisKelamin ?? '';
    databaseInstance.database();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff041C32),
        centerTitle: true,
        title: Text('Update Data'),
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
              'No. HP',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'No. HP',
                // labelText: 'No. HP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
              value: jenisKelaminController.text,
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
                  child: Text('Laki-laki'),
                  value: 'Laki-laki',
                ),
                DropdownMenuItem(
                  child: Text('Perempuan'),
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
              height: 35,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Color(0xff064663),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                databaseInstance.update(widget.mahasiswaModel!.id!, {
                  'name': nameController.text,
                  'nim': nimController.text,
                  'alamat': alamatController.text,
                  'phone': phoneController.text,
                  'jenis_kelamin': jenisKelaminController.text,
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
