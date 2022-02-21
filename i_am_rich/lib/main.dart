// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 100.0,
          title: const Center(
            child: Image(
                height: 100.0,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/logo_full.png',
                )),
          ),
        ),
        body: Container(
          color: Colors.white70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(
                height: 35.0,
                width: 50.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Text(
                'Varun Cuntoor',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: 35.0,
                width: 50.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Card(
                color: Colors.black,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                  ),
                  title: Text('varunization@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              Card(
                color: Colors.black,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.white,
                  ),
                  title: Text('+91 9902654831',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
