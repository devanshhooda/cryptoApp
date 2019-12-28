import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List currencies;
  Home(this.currencies);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List currencies;
  final List<MaterialColor> _color = [
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      // appBar: new AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.grey[100],
      //   centerTitle: true,
      //   title: Text("C R Y P T O",
      //       style: TextStyle(
      //           fontStyle: FontStyle.italic,
      //           color: Colors.pink[500],
      //           fontWeight: FontWeight.bold,
      //           fontSize: 24)),
      //   actions: <Widget>[
      //     Image.asset(
      //       'assets/crypto.png',
      //       alignment: Alignment.centerLeft,
      //     ),
      //   ],
      // ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Devansh Stan'),
            accountEmail: Text('devanshstan2001@gmail.com'),
            currentAccountPicture: new CircleAvatar(
              child: Image.asset(
                'assets/crypto.png',
                alignment: Alignment.centerLeft,
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: <Widget>[
              new CircleAvatar(child: Text('D')),
              new CircleAvatar(child: Text('S'))
            ],
          ),
        ],
      )),
      body: cryptoWidget(),
    );
  }

  Widget cryptoWidget() {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          pinned: true,
          floating: false,
          expandedHeight: 50,
          elevation: 0.0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          title: Text("C R Y P T O",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.pink[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          // actions: <Widget>[
          //   Image.asset(
          //     'assets/crypto.png',
          //     alignment: Alignment.centerLeft,
          //   ),
          // ],
        ),
        new SliverFillRemaining(
          child: new Card(
              // margin: EdgeInsets.all(10),
              color: Colors.grey[100],
              child: new Column(
                children: <Widget>[
                  new Flexible(
                    child: new ListView.builder(
                      itemCount: widget.currencies.length,
                      itemBuilder: (BuildContext context, int idx) {
                        final Map currency = widget.currencies[idx];
                        final MaterialColor clr = _color[idx % _color.length];
                        return display(currency, clr);
                      },
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              )),
        )
      ],
    );

    // return new Card(

    //     // margin: EdgeInsets.all(10),
    //     color: Colors.grey[100],
    //     child: new Column(
    //       children: <Widget>[
    //         new Flexible(
    //           child: new ListView.builder(
    //             itemCount: widget.currencies.length,
    //             itemBuilder: (BuildContext context, int idx) {
    //               final Map currency = widget.currencies[idx];
    //               final MaterialColor clr = _color[idx % _color.length];
    //               return display(currency, clr);
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(40.0),
    //     ));
  }
}

Widget display(Map currency, MaterialColor clr) {
  return Column(
    children: <Widget>[
      new ListTile(
        title: Text(
          currency['name'],
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 21),
        ),
        subtitle:
            getSubTitle(currency['price_usd'], currency['percent_change_1h']),
        leading: CircleAvatar(
          radius: 25,
          child: Text(currency['symbol'],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: clr,
        ),
        isThreeLine: true,
      ),
      new Container(
        child: new Divider(),
        padding: EdgeInsets.only(left: 70, right: 10),
      )
    ],
  );
}

Widget getSubTitle(String price, String prcntChng) {
  TextSpan priceTextWidget =
      new TextSpan(text: '\$$price\n', style: TextStyle(color: Colors.indigo));

  TextSpan prcntChngWidget;

  if (double.parse(prcntChng) > 0) {
    prcntChngWidget = new TextSpan(
        text: '⬆ Last 1 hour: $prcntChng ',
        style: TextStyle(color: Colors.green));
  } else if (double.parse(prcntChng) < 0) {
    prcntChngWidget = new TextSpan(
        text: '⬇ Last 1 hour: $prcntChng ',
        style: TextStyle(color: Colors.red));
  } else if (double.parse(prcntChng) == 0.0) {
    prcntChngWidget = new TextSpan(
        text: 'Last 1 hour: $prcntChng', style: TextStyle(color: Colors.lime));
  }

  return RichText(
    text: TextSpan(
      children: [priceTextWidget, prcntChngWidget],
    ),
  );
}
