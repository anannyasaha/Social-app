import 'package:flutter/material.dart';
import 'package:twitter_home/tweetwidget.dart';
import 'profilepage.dart';
import 'video_playerpage.dart';
import 'comment.dart';
class tweet extends StatefulWidget {
  tweet({Key key, this.title}) : super(key: key);



  final String title;

  @override
  tweetstate createState() => tweetstate();
}

class tweetstate extends State<tweet> {

tweetwidget Tweet1=new tweetwidget(initials:"NG",userShortName: "@NatGeo",userLongName: "National Geographic",timeString: "2h",description:'Beautiful Blue robin',imageURL: "https://i.pinimg.com/originals/2e/03/f6/2e03f61002a7a8375de23a89a433644a.jpg",numComments: 26,numLikes: 1001,numRetweets: 309,profilepic:"https://www.vets4pets.com/siteassets/species/cat/close-up-of-cat-looking-up.jpg?w=585&scale=down" ,coverpic: "http://martaspetshop.ca/wp-content/uploads/mps-header-fish.jpg",placeofbirth: "Denver,Colorado",workplace: "SkyWatch",dateofbirth: "12th October 1998",colortoggle: false,showComment: false);
tweetwidget Tweet2=new tweetwidget(initials:"MK",userShortName: "@MikCor",userLongName: "Michael Korse         ",timeString: "4h",description:"Get your own for 20% sale",imageURL: "https://cdn2.jomashop.com/media/catalog/product/m/i/michael-kors-signature-jet-set-vanilla-messenger-bag-30t2gtvm3b150.jpg",numComments: 14,numLikes: 1451,numRetweets: 479,profilepic:"https://lemudaonlineshopping.files.wordpress.com/2014/11/buy-michael-kors-handbag.jpg" ,coverpic: "http://www.soundandcommunications.com/wp-content/uploads/2014/10/Sale-banner.jpg",placeofbirth: "South California",workplace: "Fashionista",dateofbirth: "15th November 2000",colortoggle: false,showComment: false);
tweetwidget Tweet3=new tweetwidget(initials:"NG",userShortName: "@NasDai",userLongName: "Nasdaily               ",timeString: "2h",description:"Moving to Singapore!",imageURL: "https://wakeupsg.files.wordpress.com/2019/08/190403_nas_fb_43.jpg",numComments: 106,numLikes: 401,numRetweets: 209,profilepic:"https://wakeupsg.files.wordpress.com/2019/08/190403_nas_fb_43.jpg" ,coverpic: "https://shout.sg/wp-content/uploads/2018/10/Nas-Daily-In-Singapore-3.jpg",placeofbirth: "Palestine,Israel",workplace: "Nas daily",dateofbirth: "10th August 1887",colortoggle: false,showComment: false);
List<String> items=["Send as Message","Share in timeline","Share in group","Share in page"];
List<comment> twocomments=[comment(name:"Jennifer Aniston",comments:"Very Beautiful",picURL:"https://static.onecms.io/wp-content/uploads/sites/35/2019/09/11143414/Jennifer-Aniston-Primary.jpg"),comment(name:"Margot Robbie",comments:"Love this",picURL: "https://cdn.newsapi.com.au/image/v1/031afdcd05dc456f37d85f562f7121e9")];
Widget buildtweet(tweetwidget Tweet){
  return  new Row(
      children: <Widget>[
        new GestureDetector(
              onTap:(){
             gotoprofilepage(Tweet);
          },
              child: Container(
                padding:EdgeInsets.only(top:0,bottom:Tweet.showComment?470:370,left:5,right:5),
                child: new CircleAvatar(
                    radius: 25.00,
                    backgroundColor: Colors.yellow,
                    backgroundImage:NetworkImage(Tweet.imageURL)
          ),
              ),
        )
        ,

        Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical:0),
          child: new Column(
              children: <Widget>[
                new Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){ gotoprofilepage(Tweet);},
                        child: new Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: new Text(Tweet.userLongName,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: new Text(
                              Tweet.userShortName, style: new TextStyle(fontSize: 16))),
                      Container(
                          padding: EdgeInsets.only(
                              left:5,right:20,top:5, bottom: 5),
                          child: new Text(
                              Tweet.timeString, style: new TextStyle(fontSize: 16))),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                      )
                    ]),

                Container(
                  padding:EdgeInsets.only(top:0,bottom:5,left:0,right:0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: new Text(
                    Tweet.description,
                    style: new TextStyle(fontSize: 18,),
                    softWrap: true,),
                ),

                GestureDetector(
                  onTap: (){
                    //gotovideopage(Tweet);
                  },
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:10,horizontal:0),
                    alignment: Alignment.topLeft,
                    child: new Image.network(Tweet.imageURL,width: 320.0,
                        height: 250.0,
                        fit:BoxFit.fill),),
                )
                ,
                Row(
                    children:<Widget>[
                      Container(

                        padding: EdgeInsets.only(left:5,top:0,right:0,bottom:20),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon:Icon(Icons.chat_bubble_outline,size:35,),
                          onPressed:(){
                            _customDialog(context,Tweet);
                            setState(() {
                              Tweet.showComment=!Tweet.showComment;
                            });
                          }
                        ),
                      ),
                      Container(
                          padding:EdgeInsets.only(left:5,top:0,right:20,bottom:20),
                          child: Text(Tweet.numComments.toString(),style:new TextStyle(fontSize: 20))),
                      Container(
                        padding: EdgeInsets.only(left:5,top:0,right:0,bottom:20),
                        child: PopupMenuButton(
                            icon:Icon(
                          Icons.repeat,
                          size: 35,
                        ),
                          onSelected: (String value) {
                              setState(() {
                                Tweet.numRetweets++;
                              });

                           },
                          itemBuilder: (BuildContext context) {
                            return items
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left:5,top:0,right:20,bottom:20),
                          child: Text(Tweet.numRetweets.toString(),style:new TextStyle(fontSize: 20))),
                      Container(
                        padding: EdgeInsets.only(left:5,top:0,right:0,bottom:20),
                        child: lovebutton(Tweet),
                      ),
                      Container(
                          padding: EdgeInsets.only(left:5,top:0,right:20,bottom:20),
                          child: Text(Tweet.numLikes.toString(),style:new TextStyle(fontSize: 20))),

                    ]

                ),
                   _createcommentList(Tweet)
              ]
          ),
        ),
      ]
  );
}
Widget _createcommentList(tweetwidget Tweet) {
   if(Tweet.showComment==true){
    return Column(
      children:[
        Container(
          padding:EdgeInsets.only(right:60),
          child:Row(

           children:[Container(
             padding:EdgeInsets.all(10),
             child: CircleAvatar(
                backgroundImage:NetworkImage(twocomments[0].picURL),
              ),
           ),
            Container(padding:EdgeInsets.only(bottom:20),
                child: Text(twocomments[0].name+":",style:new TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
             Container(padding:EdgeInsets.only(bottom:20,left:5),child: Text(twocomments[0].comments,style: new TextStyle(fontSize: 15),))
            ])
          ),Container(
            padding:EdgeInsets.only(right:90),
            child:Row(

                children:[Container(
                  padding:EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage:NetworkImage(twocomments[1].picURL),
                  ),
                ),
                  Container(padding:EdgeInsets.only(bottom:20),
                      child: Text(twocomments[1].name+":",style:new TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                  Container(padding:EdgeInsets.only(bottom:20,left:5),child: Text(twocomments[1].comments,style: new TextStyle(fontSize: 15),))
                ])
        )


      ]);}
   else return Divider();
  }



Widget lovebutton(tweetwidget Tweet){

  return IconButton(
    icon: Icon(
        Icons.favorite_border,
        size:35,color:(Tweet.colortoggle)?Colors.red:Colors.black ),
    onPressed: (){
      setState(() {
        Tweet.colortoggle=!Tweet.colortoggle;
        print(Tweet.colortoggle);
        if(Tweet.colortoggle==true)
          Tweet.numLikes++;
        else Tweet.numLikes--;
      });

    },

  );
}
Future<void> _customDialog(BuildContext context,tweetwidget Tweet) {
  String name;
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: AlertDialog(

                content: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 240),
                      child: IconButton(icon:Icon(Icons.arrow_back),
                        onPressed: (){
                          Navigator.of(context).pop();
                      },),
                    ),
                    TextField(
                        decoration: InputDecoration(labelText: "Comment"),
                        onChanged: (value) {
                          name = value;
                        }
                    ),
                  ],
                ),
                actions: [RaisedButton(
                  child: Text("Done"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      Tweet.numComments++;
                    });


                  },
                )
                ]
            )
        );
      });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      body:

      Container(
        padding: EdgeInsets.only(top:10,right:0,left:5,bottom:0),
        child: ListView(

          children:<Widget>
          [buildtweet(Tweet1),
          buildtweet(Tweet2),
          buildtweet(Tweet3)
          ]
      )),
    );
  }
void gotoprofilepage(tweetwidget Tweet) async {
  var gradepage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => profilepage(tweet: Tweet),
      ));
}
/*void gotovideopage(tweetwidget Tweet) async {
  var gradepage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => video_player_screen(tweet: Tweet),
      ));
}*/
}
