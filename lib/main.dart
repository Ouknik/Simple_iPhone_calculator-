import 'package:flutter/material.dart';

void main() => runApp(Mycalculator());

class Mycalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: " ", home: Calculator());
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = '0';
  double numbreone = 0;
  double nmbreTwo = 0;
  String result = '0';
  String finalResule = '0';
  String opr = '';
  String prevopr = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dadda ouknik",
          style: TextStyle(
              color: Colors.black, fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("C", Color(0xffa5a5a5), 0),
                button("+/-", Color.fromRGBO(165, 165, 165, 1), 0),
                button("%", Color(0xffa5a5a5), 0),
                button("/", Color(0xffff9800), 0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7", Color(0xff323232), 0),
                button("8", Color(0xff323232), 0),
                button("9", Color(0xff323232), 0),
                button("X", Color(0xffff9800), 0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4", Color(0xff323232), 0),
                button("5", Color(0xff323232), 0),
                button("6", Color(0xff323232), 0),
                button("-", Color(0xffff9800), 0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", Color(0xff323232), 0),
                button("2", Color(0xff323232), 0),
                button("3", Color(0xff323232), 0),
                button("+", Color(0xffff9800), 0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("0", Color(0xff323232), 100),
                button(".", Color(0xff323232), 0),
                button("=", Color(0xffff9800), 0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String btnText, Color color, int num) {
    Container container;
    if (num == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calcul(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calcul(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
          shape: StadiumBorder(),
        ),
      );
    }
    return container;
  }

  void calcul(txtBtn) {
    if (txtBtn == 'C') {
      text = '0';
      numbreone = 0;
      nmbreTwo = 0;
      result = '0';
      finalResule = '0';
      opr = '';
      prevopr = '';
    } else if (opr == '=' && txtBtn == '=') {
      switch (prevopr) {
        case '+':
          finalResule = add();
          break;
        case '-':
          finalResule = sub();
          break;
        case 'X':
          finalResule = multi();
          break;
        case '/':
          finalResule = dev();
          break;
      }
    } else if (txtBtn == '+' ||
        txtBtn == '-' ||
        txtBtn == 'X' ||
        txtBtn == '/' ||
        txtBtn == '=') {
      if (numbreone == 0) {
        numbreone = double.parse(result);
      } else {
        nmbreTwo = double.parse(result);
      }
      switch (opr) {
        case '+':
          finalResule = add();
          break;
        case '-':
          finalResule = sub();
          break;
        case '*':
          finalResule = multi();
          break;
        case '/':
          finalResule = dev();
          break;
      }
      prevopr = opr;
      opr = txtBtn;
      result = '';
    } else if (txtBtn == '.') {
      if (!result.contains('.')) result += '.';
      finalResule = result;
    } else if (txtBtn == '+/-') {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
      finalResule = result;
    } else if (txtBtn == '%') {
      result = (double.parse(finalResule) / 100).toString();
      finalResule = result;
    } else {
      if (result == '0') {
        result = txtBtn;
        finalResule = result;
      } else {
        result = result + txtBtn;
        finalResule = result;
      }
    }

    setState(() {
      text = finalResule;
    });
  }

  String add() {
    result = (numbreone + nmbreTwo).toString();
    numbreone = double.parse(result);
    return decimalRemove(result);
  }

  String sub() {
    result = (numbreone - nmbreTwo).toString();
    numbreone = double.parse(result);
    return decimalRemove(result);
  }

  String multi() {
    result = (numbreone * nmbreTwo).toString();
    numbreone = double.parse(result);
    return decimalRemove(result);
  }

  String dev() {
    result = (numbreone / nmbreTwo).toString();
    numbreone = double.parse(result);
    return decimalRemove(result);
  }

  String decimalRemove(String _result) {
    if (_result.contains('.')) {
      List<String> split = _result.split('.');
      //11.2 ==> [11,2];
      if (!(int.parse(split[1]) > 0)) {
        return split[0];
      }
    }
    return _result;
  }
}
