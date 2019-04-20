import 'package:flutter/material.dart';
//import 'second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyHomePage> {
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String str       = "";
  String txtField  = "";
  String txtField2 = "";

  void _changeText (String val, String val2, int opcion){
    double num = double.parse(val);
    double num2 = double.parse(val2);
    switch (opcion) {
      case 1:
        double suma = num + num2;
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('"La suma es: $suma'),
          duration: Duration(seconds: 3),
        ));
        break;

       case 2:
        double resta = num-num2;
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('La resta es: $resta'),
          duration: Duration(seconds: 3),
        ));
        break;

      case 3:
        double multiplicacion = num*num2;
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('La multiplicacion es: $multiplicacion'),
          duration: Duration(seconds: 2),
        ));
      break;

      case 4:
      double divi = num/num2;
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('La división es: $divi'),
          duration: Duration(seconds: 2),
        ));
      break;
      default:
    }
    print("OnSubmit: El Texto es $val & $val2");
    setState((){
      txtField = val;
      txtField2 = val2;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('El texto es $val & $val2'),
      duration: Duration(seconds: 2),
    ));
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('First Page'),
      ),
      body: new  Container(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: "Text Something...",
              ),
              keyboardType: TextInputType.number,
              controller: _controller,
            ),
            new TextField(
              decoration: new InputDecoration(
                hintText: "Type something...",
              ),
              keyboardType: TextInputType.number,
              controller: _controller2,
            ),
            new RaisedButton(
              child: new Text("+"),
              onPressed: (){
                _changeText(_controller.text, _controller2.text,1);
                _controller.text = "";
                _controller2.text = "";
              },
            ),
            new RaisedButton(
              child: new Text("-"),
              onPressed: (){
                _changeText(_controller.text, _controller2.text,2);
                _controller.text = "";
                _controller2.text = "";
              },
            ),
            new RaisedButton(
              child: new Text("*"),
              onPressed: (){
                _changeText(_controller.text, _controller2.text, 3);
                _controller.text = "";
                _controller2.text = "";
              },
            ),
            new RaisedButton(
              child: new Text("/"),
              onPressed: (){
                _changeText(_controller.text, _controller2.text, 4);
                _controller.text = "";
                _controller2.text = "";
              },
            )
          ],
        ),
      ),
    );
  }
}