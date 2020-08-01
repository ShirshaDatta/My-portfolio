import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';



MyApp()
{
  mylike()
  {
    Fluttertoast.showToast(
        msg: "You just liked my profile picture",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  mydata() async {
    var url = "http://192.168.0.10/home.html";
    var r = await http.get(url);
    var sc = r.body;
    print(sc);
  }
  
  myfav() {
    //Navigator.push(context, route);

  }
  var myactions = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      IconButton(icon: Icon(Icons.search),onPressed: mydata, ),
      IconButton(icon: Icon(Icons.notifications), onPressed: () => print("hi hello") ,),
      IconButton(icon: Icon(Icons.favorite), onPressed: myfav ,),
      IconButton(icon: Icon(Icons.add), onPressed: null ,),
    ]
  );
  
  var myappbar = AppBar(
    title: Text('My portfolio'),
    backgroundColor: Colors.red.shade400,
    leading: Icon(Icons.menu),
    actions: <Widget> [myactions, ] ,);

  var mybody = Container(
    alignment: Alignment.center,
    //border: Border.all(10),
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey.shade300,
    margin: EdgeInsets.all(20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.grey.shade600,
            width: 3,
            )
        ),
        alignment: Alignment.center,
        //padding: EdgeInsets.all(70),
        margin: EdgeInsets.all(50),
        width: 300,
        height: 200,
        //color: Colors.red.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.account_box,
                  color: Colors.black,
                  size: 25.0,),
                Text(
                  'Shirsha Datta',
                  style: 
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 25.0,),
                Text(
                  'shirshadatta2000@gmail.com',
                  style: 
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                      ),
              ],
            ),
        ],
        ),
      ),
      
      GestureDetector(
        onDoubleTap: mylike,
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.yellowAccent,
            image: const DecorationImage(
              image: NetworkImage('https://shirshadatta.github.io/app2/meh.jpeg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(110),
            border: Border.all(
              color: Colors.grey.shade600,
              width: 3,
              )
              ),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          width: 110,
          height: 110,
          //child: Image.network('https://github.com/ShirshaDatta/app2/blob/master/meh.jpeg'),
          //color: Colors.yellowAccent
        ),
      ),
    ],
    ),
    );
  
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: myappbar,
      body: mybody,
    ),
  );
}