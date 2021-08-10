import 'package:baliza/Helper/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class MyDetailPage extends StatefulWidget {
  MySuperHero _superHero;

  MyDetailPage(MySuperHero superHero) {
    _superHero = superHero;
  }

  @override
  _MyDetailPageState createState() => _MyDetailPageState(_superHero);
}

class _MyDetailPageState extends State<MyDetailPage> {
  MySuperHero superHero;
  List photos = ["assets/images/3.jpg", 'assets/images/4.jpg'];

  _MyDetailPageState(MySuperHero superHero) {
    this.superHero = superHero;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(superHero.bg), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            top: 30,
            left: 25,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            )),
        Positioned(
            top: 100,
            left: 30,
            child: Hero(
              transitionOnUserGestures: true,
              tag: superHero,
              child: Transform.scale(
                scale: 1,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(superHero.img),
                ),
              ),
            )),
        Positioned(
            top: 210,
            left: 30,
            child: Text(
              superHero.title.split(" ").first,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            )),
        Positioned(
            top: 260,
            left: 30,
            child: Text(
              superHero.title.split(" ").last,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            )),
        Positioned(
          top: 323,
          left: 30,
          child: Helper.subtext(superHero.id, 18, 0, Colors.white),
        ),
        Positioned(
            top: 380,
            left: 30,
            child: Row(
              children: [
                Image.network(
                  "https://i.ibb.co/DrbscXF/pin.png",
                  height: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Helper.subtext(superHero.location, 18, 0, Colors.white),
              ],
            )),
        Positioned(
            top: 420,
            left: 30,
            child: Row(
              children: [
                Image.network(
                  "https://i.ibb.co/mD9BSqH/instagram.png",
                  height: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Helper.subtext(superHero.instaid, 18, 0, Colors.white),
              ],
            )),
        Positioned(
          bottom: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              color: Colors.transparent,
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: new Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Helper.subtext('Photos', 15, 0, Colors.black),
                          Helper.subtext('Likes', 15, 0, Colors.grey),
                          Helper.subtext('Collection', 15, 0, Colors.grey),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: photos.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      image: DecorationImage(
                                          image: AssetImage(photos[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 220,
                                ),
                              );
                            }),
                      )
                    ],
                  ))),
            ),
          ),
        ),
      ],
    ));
  }
}
