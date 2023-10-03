import 'package:flutter/material.dart';
import 'package:kuis/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku lokasi;
  const HalamanDetail({super.key, required this.lokasi});


  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {

  // final TourismPlace lokasi = tourismPlaceList[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
         title: Text(widget.lokasi.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: widget.lokasi.isBookmarked
                ?Icon(
              Icons.bookmark,
              color: Colors.white,
            )
                :Icon (
              Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.lokasi.isBookmarked = !widget.lokasi.isBookmarked;
              }
              );
              final snackBar = SnackBar(content: Text ( widget.lokasi.isBookmarked?'Berhasil Menambahkan Boorkmark':'Berhasil Menghapus Boorkmark',
              ),
                backgroundColor: (widget.lokasi.isBookmarked)?Colors.green : Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SingleChildScrollView (
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              // Text(widget.lokasi.title, style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2,
                child: Image.network(widget.lokasi.imageLink),),
              Container(
                child:
                Text(
                  widget.lokasi.title,
                ),
              ),
              Container(
                child: Text(widget.lokasi.author
                ),
              ),
              Container(
                child: Text(widget.lokasi.year.toString(),
                ),
              ),
              Container(
                child: Text(widget.lokasi.country
                ),
              ),
              Container(
                child: Text(widget.lokasi.language
                ),
              ),
              Container(
                child: Text(widget.lokasi.pages.toString(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.lokasi.link);
        },
        child: Icon(Icons.search),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
