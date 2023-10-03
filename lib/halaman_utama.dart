import 'package:flutter/material.dart';
import 'package:kuis/halaman_detail.dart';
import 'package:kuis/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Data Buku'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku lokasi = listBuku[index];
          return InkWell(
            onTap: () {
              // Navigator.pop(context); /buat buang halaman ini
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetail(lokasi: lokasi),
                  ));
            },
            child: Card(
              child: SizedBox(
                //width: 250,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          child: Image.network(
                            lokasi.imageLink,
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(height: 5),
                    Text(lokasi.title, textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
