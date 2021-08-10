import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Avengers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MySuperHero {
  final String img;
  final String title;
  final String id;
  final String body;
  final String bg;
  final String location;
  final String instaid;

  MySuperHero(
    this.img,
    this.title,
    this.id,
    this.body,
    this.bg,
    this.location,
    this.instaid,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  List<MySuperHero> items = <MySuperHero>[];

  _MyHomePageState() {
    items.add(new MySuperHero(
        "https://images.indianexpress.com/2021/07/messi-barcelona.jpg",
        "Lionel Messi",
        "@messi",
        "Genius. Billionaire. Playboy. Philanthropist. Tony Stark's confidence is only matched by his high-flying abilities as the hero called Iron Man.",
        "https://images.pexels.com/photos/1477166/pexels-photo-1477166.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "Rosario, Argentina",
        "instagram.com/messi"));
    items.add(new MySuperHero(
        "https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=425,format=auto/sites/default/files/styles/768x768/public/d8/images/methode/2020/06/24/cf9d675c-b1fe-11ea-953d-a7ecc5cbd229_image_hires_144326.jpg?itok=cjfUeF1R&v=1592981014",
        "Cristiano Ronaldo",
        "@ronaldo",
        "Recipient of the Super-Soldier serum, World War II hero Steve Rogers fights for American ideals as one of the world’s mightiest heroes and the leader of the Avengers.",
        "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
        "Funchal, Portugal",
        "instagram.com/ronaldo"));

    items.add(new MySuperHero(
        "https://pbs.twimg.com/profile_images/1309436258389819393/aTHNVYwL_400x400.jpg",
        "Robert Lewandowski",
        "@robert",
        "Dr. Bruce Banner lives a life caught between the soft-spoken scientist he’s always been and the uncontrollable green monster powered by his rage.",
        "https://images.pexels.com/photos/5876469/pexels-photo-5876469.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        " Warsaw, Poland",
        "instagram.com/robert"));
    items.add(new MySuperHero(
        "https://images.mid-day.com/images/images/2021/apr/Sergio-Ramos-positive_d.jpg",
        "Sergio Ramos",
        "@sergio",
        "The son of Odin uses his mighty abilities as the God of Thunder to protect his home Asgard and planet Earth alike.",
        "https://images.pexels.com/photos/3306986/pexels-photo-3306986.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "Camas, Spain",
        "instagram.com/ramos"));
  }

  Widget listCard(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDetailPage(items[index])));
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(items[index].bg), fit: BoxFit.cover)),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                    tag: items[index],
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                items[index].img,
                              ),
                              fit: BoxFit.cover)),
                    )),
                SizedBox(
                  width: 16,
                ),
                Text(
                  items[index].title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => listCard(context, index),
            ),
            Positioned(
                top: 10,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                    Container(
                      child: Text(
                        'Plants',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
