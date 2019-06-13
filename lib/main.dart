import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:pizza_app/pizza.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Order',
      home: PizzaHome(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "slabo"),
    );
  }
}

class PizzaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: MainApp(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 50, right: 30),
      child: ListView(
        children: <Widget>[titleBar(), tabs()],
      ),
    );
  }
}

Widget titleBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(
        height: 70.0,
      ),
      Text(
        "Featured",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
      ),
      Text(
        "Food",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
      )
    ],
  );
}

Widget tabs() {
  return Container(
    height: 550,
    width: double.infinity,
    child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(top: 15),
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "slabo"),
                      unselectedLabelColor: Colors.black26,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w200,
                          fontFamily: "slabo"),
                      tabs: <Widget>[
                        Container(
                          child: Text(
                            "Pizza",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Rolls"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Burgers"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Sandwiches"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            pizzaShowCase(),
            // Center(
            //   child: Text(
            //     "Pizza Tab",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 15),
            //   ),
            // ),
            Center(
              child: Text(
                "Rolls Tab",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "Burgers Tab",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "Sandwiches Tab",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget pizzaShowCase() {
  return Container(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pizzaList.pizzas.length,
      itemBuilder: (BuildContext context, int i) {
        return ListofPizzas(
          name: pizzaList.pizzas[i].name,
          image: pizzaList.pizzas[i].image,
          background: pizzaList.pizzas[i].background,
          foreground: pizzaList.pizzas[i].foreground,
          price: pizzaList.pizzas[i].price,
          pizzaObject: pizzaList.pizzas[i],
        );
      },
    ),
  );
}

class ListofPizzas extends StatelessWidget {
  const ListofPizzas({
    @required this.image,
    @required this.background,
    @required this.foreground,
    @required this.name,
    @required this.price,
    @required this.pizzaObject,
  });
  final Color foreground;
  final Color background;
  final double price;
  final String name;
  final String image;
  final Pizza pizzaObject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          width: 225,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: Image.asset(image),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                softWrap: true,
                text: TextSpan(
                    style: TextStyle(
                        color: foreground, fontSize: 25, fontFamily: "slabo"),
                    children: [
                      TextSpan(text: name),
                      TextSpan(
                          text: "\nPizza",
                          style: TextStyle(fontWeight: FontWeight.w800))
                    ]),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("\$$price",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: foreground,
                            fontFamily: "arial")),
                  ),
                  StatefulFavIcon(foreground: foreground)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StatefulFavIcon extends StatefulWidget {
  final Color foreground;
  const StatefulFavIcon({@required this.foreground});

  _StatefulFavIconState createState() => _StatefulFavIconState();
}

class _StatefulFavIconState extends State<StatefulFavIcon> {
  bool isfav;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isfav = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isfav = !isfav;
        });
      },
      child: Icon(
        isfav ? Icons.favorite : Icons.favorite_border,
        color: widget.foreground,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double _size = 60;
  final double _padding = 17;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/home_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/search_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Image.asset(
                "assets/bag_icon.png",
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
