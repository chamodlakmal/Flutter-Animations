import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:Root() ,
    );
  }
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {  
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: 
    animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: animationController,
     builder: (BuildContext context,Widget child){
       return Scaffold(
         body: Transform(transform: 
         Matrix4.translationValues(animation.value*width, 0, 0),
         child: new Center(
           child: Container(child: 
           Text("Chamod Lakmal",
           style: TextStyle(fontSize: 20.0,
           fontWeight: FontWeight.bold),),),
         ),),
          
       );
     });
   
  }
}