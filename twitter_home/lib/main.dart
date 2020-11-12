import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_home/profilepage.dart';
import 'tweet.dart';
import 'video_playerpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: tweet(title: 'My social app'),
      routes:<String,WidgetBuilder>{
        '/profilepage':(BuildContext context)=>profilepage(tweet: "Tweet",),
       // '/video_playerpage':(BuildContext context)=>video_player_screen(tweet: "Tweet",)
      }
    );
  }
}


