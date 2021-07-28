import 'package:flutter/material.dart';
import 'detailScreen.dart';
import 'dataList.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Wisata Cirebonan',
        ),
   
       
      ),
      body: ListView(
        children: dataTempatWisata.map((place) {
          // ignore: deprecated_member_use
          return FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Material(
                elevation: 3,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Hero(
                          tag: place.tag,
                          child: Image.asset(
                            place.gambar,
                            height: 80,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              place.nama,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(place.lokasi,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
