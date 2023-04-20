import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workoutapp/model/workout.dart';

class WorkoutDetail extends StatefulWidget {
  const WorkoutDetail({Key? key}) : super(key: key);

  static const String routeName ='/workout-details';

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  var workoutname="";
  var workoutcatergory="";
  var workoutgif="";
  var reps="";
  var sets="";
  var workoutimageUrl="";
  var workoutyoutubeUrl="";
  var listimgurl="";

  Workout? workout;

  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){
    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print(productString);

    var workoutjson= jsonDecode(productString);

    setState(() {
      workout = Workout.fromJson(workoutjson);
      workoutname = workout!.name;
      workoutcatergory =workout!.category;
      workoutgif = workout!.gif;
      reps=workout!.reps;
      sets=workout!.sets;
      workoutimageUrl =workout!.imageUrl;
      listimgurl=workout!.listimgurl;
      workoutyoutubeUrl = workout!.youtubeUrl;
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body:NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              title: Text(workoutname,
                  style:TextStyle(color:Colors.white)
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              toolbarHeight: 100.0,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(listimgurl,
                  fit: BoxFit.cover,
                  color: Color(0xaa212121),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child:Padding(
                  padding: const EdgeInsets.only(
                      bottom: 24.0, left:12.0, right: 12.0
                  ),
                  child: Text("Catergory "+workoutcatergory,style: TextStyle(color: Colors.white,fontSize:20 ),)
                ),
              ),

            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height:40,
                        width:width * 0.7,
                      ),

                      Text("Reps :"+reps,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                      SizedBox(
                        height:20,
                      ),

                      Text("Sets : "+sets),
                      SizedBox(
                        height:40,
                      ),

                      Image.network(workoutimageUrl, width: 500,height: 200),

                      Image(
                        image: NetworkImage(workoutgif),
                        width: 500,
                        height: 200,
                      )


                    ],
                  ),
                ),

              )
          ),
        ),

      )

    );
  }
}
