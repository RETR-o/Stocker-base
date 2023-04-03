import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Input Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userInput='';
  String userInput2='';
  late Widget googleFormWidget;

  @override
  void initState() {
    super.initState();
    googleFormWidget = Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock App',style: TextStyle(color: Colors.cyanAccent), ),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  userInput = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Company:',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userInput2 = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter your Stock place:',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                setState(() {
                  googleFormWidget = GoogleFormScreen(userInput: userInput, userInput2: userInput2);
                });
              },
              child: Text('Search',style: TextStyle(color: Colors.cyanAccent),),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: googleFormWidget,
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleFormScreen extends StatelessWidget {

  final String userInput;
  final String userInput2;


  const GoogleFormScreen({required this.userInput, required this.userInput2});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      "<iframe frameBorder='0' scrolling='no' width='800' height='420' src='https://api.stockdio.com/visualization/financial/charts/v1/HistoricalPrices?app-key=9A633751339F4286AB163468FE2BF6F6&stockExchange=$userInput2&symbol=$userInput&displayPrices=HLC&dividends=true&splits=true&palette=Financial-Light'></iframe>",
      key: ValueKey(userInput + userInput2),
    );
  }
}
