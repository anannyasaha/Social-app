import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_home/tweetwidget.dart';
import 'tweetwidget.dart';
class profilepage extends StatefulWidget {
  var tweet;
  profilepage({Key key,this.tweet}):super(key:key);
  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.tweet.userLongName),
            leading:IconButton(
               icon: Icon(Icons.arrow_back),
               onPressed: (){
                 Navigator.of(context).pop();
               }),
      ),
         body:_createtimeline(context),

    );
  }
  Widget _createtimeline(BuildContext context){
    return ListView(
      children: [
        Stack(
          children: [
            Image.network(widget.tweet.coverpic),
            Container(
              padding:EdgeInsets.only(top:80),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.tweet.profilepic),
              ),
            )
          ],
        ),
        Container(
          padding:EdgeInsets.only(top:15,bottom:15,left:10,right:30),
            child: Text(widget.tweet.userLongName,
                textScaleFactor: 1.4,
                style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.left)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical:10,horizontal: 70),
              width: 220,
              height: 42,
              child: Text("Message",textScaleFactor: 1.2,style: TextStyle(color:Colors.white)),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color:Colors.blue
              ),

            ),
            Container(
                height: 42,
                width:42,
              child:Icon(Icons.person_add),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
               color:Color(0xFFe0e0e0))
            ),
            Container(
                height: 42,
                width:42,
                child:Icon(Icons.more_vert),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color:Color(0xFFe0e0e0))
            )
          ],
        ),
        Row(

          children: [
            Container(padding:EdgeInsets.all(5),child: Icon(Icons.home)),
            Text("Lives in ${widget.tweet.placeofbirth}")
          ],
        ),
        Row(

          children: [
            Container(padding:EdgeInsets.all(5),child: Icon(Icons.cake)),
            Text("Born in ${widget.tweet.dateofbirth}")
          ],
        ),
        Row(

          children: [
            Container(padding:EdgeInsets.all(5),child: Icon(Icons.work)),
            Text("Works in ${widget.tweet.workplace}")
          ],
        ),
        Text("Photos",textScaleFactor: 2,),
        Image.network(widget.tweet.profilepic)


      ],

    );
  }
}
