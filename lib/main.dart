import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "";
  String res = "";
  String operatortoperform = "";

  void btnclicked(String btnval) {
    if (btnval == "AC") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
      operatortoperform = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "*" ||
        btnval == "/") {
      firstnum = int.tryParse(texttodisplay) ?? 0;
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.tryParse(texttodisplay) ?? 0;
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      } else if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      } else if (operatortoperform == "*") {
        res = (firstnum * secondnum).toString();
      } else if (operatortoperform == "/") {
        if (secondnum != 0) {
          res = (firstnum / secondnum).toString();
        } else {
          res = "Error";
        }
      }
    } else {
      res = (int.tryParse(texttodisplay + btnval) ?? 0).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(btnval),
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            "$btnval",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator By CA'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: [
                custombutton("AC"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
