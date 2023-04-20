import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/drawer.dart' show MyDrawer;
// import 'package:carousel_slider/carousel_slider.dart';
import '../Widgets/Cardlist.dart' show Cardlist;
import '../Widgets/BgImage.dart' show BgImage;
import '../Pages/listitems.dart' show listItem;
import '../model/workout.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Workout> workout=[];

  @override
  void initState(){
    super.initState();
    readJsonFile();
  }

  Future<void> readJsonFile() async{
    final String response = await rootBundle.loadString('workoutlist.json');
    final workoutData= await json.decode(response);




    var list = workoutData["workout"] as List<dynamic>;

    setState(() {
      workout = list.map((e) => Workout.fromJson(e)).toList();
    });

    print(list);
  }


  GlobalKey<ScaffoldState> _scaddolfkey = GlobalKey <ScaffoldState>();

  String img_header="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";

  // List<String> trainingImage=[
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaddolfkey,
      drawer:MyDrawer(),
      body:NestedScrollView(

        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
         SliverAppBar(
           expandedHeight: 300.0,
           pinned: true,
           floating: false,
           title: Text("Workout App",
               style:TextStyle(color:Colors.white)
           ),
           centerTitle: true,
           backgroundColor: Colors.black,
           toolbarHeight: 100.0,
           leading: IconButton(
             onPressed: (){
               _scaddolfkey.currentState!.openDrawer();
               },
             icon: Icon(Icons.menu),
           ),
           flexibleSpace: FlexibleSpaceBar(
             background: Image.network(img_header,
               fit: BoxFit.cover,
               color: Color(0xaa212121),
               colorBlendMode: BlendMode.darken,
             ),
           ),
           bottom: PreferredSize(
               preferredSize: Size.fromHeight(100.0),
              child:Padding(
                padding: const EdgeInsets.only(
                  bottom: 24.0, left:12.0, right: 12.0
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
                    hintText: "Searching for a training Program",
                    prefixIcon: Icon(Icons.search,
                    color: Colors.black,
                    ),
                  ),
                ),
              ),
           ),
           actions: [
             IconButton(onPressed: (){

             },icon:Icon(Icons.settings)
             ),

           ],
         )
          ];
        }, body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.only(top: 34.0, right:20.0, left:20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Workouts",
                  style: TextStyle(
                 color:Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800
                  )
              ),
              SizedBox(
                height: 20.0,
              ),




              //   Expanded(child: ListView.builder(
              //     itemCount: workout.length,
              //     itemBuilder: (BuildContext context, index){
              //       return Container(child: listItem(workout[index].listimgurl,workout[index].name,workout[index].reps,workout[index].sets));
              //     },
              //   )
              //   )
              // else
              //   Container(child: Column(
              //     children: <Widget>[
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Text("No Data")
              //     ],
              //   ))


             // for(var)
             //  listItem(trainingImage[0], "Full Body Program", 53,30),
              // listItem(trainingImage[1], "Full Body Program", 53,30),
              // listItem(trainingImage[2], "Full Body Program", 53,30)
              // listItem(trainingImage[1], "Full Body Program", 53,30),
              // listItem(trainingImage[2], "Full Body Program", 53,30)
            ],
          ),
        )
      ),
      ),

    );
  }
}