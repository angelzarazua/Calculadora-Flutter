import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child:RaisedButton(
          child: Text('Open Page'),
          onPressed: (){
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => SecondPage() )
            );
          },
          textColor: Colors.white,
          color:Colors.blue,
        )
      )
    );
  }
}