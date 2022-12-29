import 'dart:io';

class MahasiswaModel {
  int? id;
  String? name, nim, alamat, phone, jenisKelamin;
  File? image;

  MahasiswaModel({
    this.id,
    this.name,
    this.nim,
    this.alamat,
    this.phone,
    this.jenisKelamin,
    this.image,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id: json['id'],
      name: json['name'],
      nim: json['nim'],
      alamat: json['alamat'],
      phone: json['phone'],
      jenisKelamin: json['jenis_kelamin'],
      // image: json['image'],

      image: File(json['image']),
    );
  }
}
