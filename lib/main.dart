import 'package:flutter/material.dart';
import 'package:remainder/bloc.dart';
import 'package:remainder/new_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  changedPage()
  {
Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondPage()));
  }


  final bloc=Bloc();
  @override
  Widget build(BuildContext context) {
return SafeArea(child: 
    Scaffold(
          body: SingleChildScrollView(child: Column(children: [
            SizedBox(height: 20.0,),
        StreamBuilder<String>(
          stream: bloc.email,
                  builder:(context,snapshot)=> TextField(
                    onChanged:(s)=> bloc.emailChanged.add(s),
            decoration: InputDecoration(
              errorText: snapshot.error,labelText: 'Email'
            ,border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            
          )),),
        ),
        SizedBox(height: 20.0,),
        StreamBuilder(
          stream: bloc.password,
                  builder:(context,snapshot)=> TextField(
                    onChanged: (p)=> bloc.passwordChanged.add(p),
            decoration: InputDecoration(errorText: snapshot.error,labelText: 'Password'
            ,border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),),
        ),
        SizedBox(height: 20.0,),
        StreamBuilder<bool>(
          stream: bloc.submitcheck,
                  builder:(context,snapshot)=> RaisedButton(onPressed:snapshot.hasData?changedPage:null,
          child: Text("submit")),
        ),
      
      ],),),
    )
    );
  }
}

