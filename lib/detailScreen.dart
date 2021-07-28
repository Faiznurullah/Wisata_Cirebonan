import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'data/data_tempat.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'Oxygen',
);

class DetailScreen extends StatelessWidget {
  final DataTempat place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
           Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              color: Colors.red.shade500,
              child: Text(
                place.nama,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Staatliches',
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              color: Colors.red.shade500,
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Lokasi',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Icon(
                            Icons.add_location_alt_outlined,
                            color: Colors.white,
                          )
                          
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${place.tempat}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Tiket Masuk',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Icon(
                            Icons.monetization_on_sharp,
                            color: Colors.white,
                          )
                          
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        place.harga,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Stack(
              children: <Widget>[
                Hero(tag: place.tag, child: Image.asset(place.gambar)),
                 FavoriteButton(),
              ],
            ),
 
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.deskripsi,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black87, height: 1.7),
              ),
            ),

            Container(
               width: 200,
               height: 40,
            child:  TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), ),

            child: Text("Keluar", style: TextStyle(color: Colors.white)),
            
           
             
                         onPressed: () {  Navigator.pop(context); },
            
                        ),
                       
                      
                        ),
            
                                 Container(
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: place.gambarDll.map((url) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(url),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
            
                      ],
                    ),
                  ),
                );
              }
            }
            
        


class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
