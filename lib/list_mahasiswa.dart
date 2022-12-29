// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_sqflite/create_data.dart';
import 'package:uas_sqflite/database_instance.dart';
import 'package:uas_sqflite/mahasiswa_model.dart';
import 'package:uas_sqflite/show_page.dart';
import 'package:uas_sqflite/update_page.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  DatabaseInstance? databaseInstance;
  Future _refresh() async {
    setState(() {});
  }

  // late File file;

  int _counter = 0;

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  Future deleteData(int id) async {
    await databaseInstance!.delete(id);
    setState(() {});
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    super.initState();
    initDatabase();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff041C32),
          centerTitle: true,
          title: Text(
            'Politeknik Negeri Malang',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'List Mahasiswa',
              ),
              Tab(
                text: 'Seputar Polinema',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              // appBar: AppBar(
              //   actions: [
              //     IconButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return CreatePage();
              //             },
              //           ),
              //         ).then((value) {
              //           setState(() {});
              //         });
              //       },
              //       icon: Icon(Icons.add),
              //     )
              //   ],
              //   backgroundColor: Color(0xff041C32),
              //   centerTitle: true,
              //   title: Text('List Mahasiswa'),
              // ),
              body: Container(
                color: Color(0xff04293A),
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: databaseInstance != null
                      ? FutureBuilder<List<MahasiswaModel>?>(
                          future: databaseInstance!.all(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.length == 0) {
                                return Center(
                                  child: Text(
                                    'Belum ada data.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xff344D67),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (builder) {
                                              return DetailMahasiswa(
                                                  mahasiswaModel:
                                                      snapshot.data![index]);
                                            },
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        focusColor: Colors.white,
                                        title: Text(
                                          snapshot.data![index].name ?? '',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index].nim ?? '',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Color(0xffEAEAEA),
                                          ),
                                        ),
                                        // leading: CircleAvatar(
                                        //   backgroundColor: Colors.white,
                                        //   child: Image.file(
                                        //     snapshot.data![index].image,
                                        //   ),
                                        //   ),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                            snapshot.data![index]
                                                        .jenisKelamin ==
                                                    'Laki-laki'
                                                ? 'assets/man.png'
                                                : 'assets/woman.png',
                                          ),
                                        ),
                                        trailing: PopupMenuButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          color: Color(0xff064663),
                                          itemBuilder: (context) {
                                            return [
                                              PopupMenuItem(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Show',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                value: 'show',
                                              ),
                                              PopupMenuItem(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Update',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                value: 'update',
                                              ),
                                              PopupMenuItem(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Delete',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                value: 'delete',
                                              ),
                                            ];
                                          },
                                          onSelected: (value) {
                                            if (value == 'show') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (builder) {
                                                    return DetailMahasiswa(
                                                        mahasiswaModel: snapshot
                                                            .data![index]);
                                                  },
                                                ),
                                              );
                                            } else if (value == 'update') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return UpdatePage(
                                                      mahasiswaModel:
                                                          snapshot.data![index],
                                                    );
                                                  },
                                                ),
                                              ).then((value) {
                                                setState(() {});
                                              });
                                            } else if (value == 'delete') {
                                              deleteData(
                                                  snapshot.data![index].id!);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              );
                            }
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreatePage();
                      },
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xff064663),
              ),
            ),
            Scaffold(
              body: Container(
                color: Color(0xff04293A),
                child: ListView(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1F4068),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Image.network(
                                'https://cdn-1.timesmedia.co.id/images/2022/10/22/Muhammad-Khoiri.jpg'),
                            ListTile(
                              title: Text(
                                'Khoiri Terharu Putranya Bisa Lulus Kuliah di Polinema Meski Lumpuh 4 Tahun',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                '22-10-2022',
                                style: TextStyle(color: Color(0xffF9F2ED)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff263859),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn-1.timesmedia.co.id/images/2022/10/22/Supriatna-Adhisuwignjo.jpg',
                                  width: 170,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Polinema Terapkan Tanda Tangan Elektronik untuk Hindari Pemalsuan Ijazah',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '22-10-2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 198, 206)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff263859),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn-1.timesmedia.co.id/images/2022/08/27/Wisuda-Polinema.jpg',
                                  width: 170,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Perdana, Polinema Lepas 12 Mahasiswa Asing Angkatan Pertama',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '27-08-2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 198, 206)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff263859),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn-1.timesmedia.co.id/images/2022/08/14/Mahasiswa-baru-POLINEMA.jpg',
                                  width: 170,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Latih Kedisiplinan dan Bela Negara, Mahasiswa Baru POLINEMA Ikuti LDK',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '14-08-2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 198, 206)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff263859),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cdn-1.timesmedia.co.id/images/2022/08/03/Polinema.jpg',
                                  width: 170,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Wamenaker RI Minta Polinema Aktif Ciptakan Tenaga Vokasi Handal',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '03-08-2022',
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 198, 206)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
