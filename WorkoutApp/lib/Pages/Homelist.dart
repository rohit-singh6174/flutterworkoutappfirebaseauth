import 'dart:convert';

import '../Pages/listitems.dart' show listItem;
import '../model/workout.dart';
import '../Widgets/drawer.dart' show MyDrawer;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Pages/WorkoutDetail.dart' show WorkoutDetail;
// import 'package:carousel_slider/carousel_slider.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> with TickerProviderStateMixin {

  GlobalKey<ScaffoldState> _scaddolfkey = GlobalKey <ScaffoldState>();
  String img_header="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  List<Workout> workout=[];


  @override
  void initState(){
    super.initState();
    readJsonFile();
  }

  Future<void> readJsonFile() async{
    final String response = await rootBundle.loadString('assets/workoutlist.json');
    final productData= await json.decode(response);

    var list = productData["workout"] as List<dynamic>;

    setState(() {
      workout = list.map((e) => Workout.fromJson(e)).toList();
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
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
                  Scaffold.of(context).openDrawer();
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
                  MyDrawer();
                },icon:Icon(Icons.settings)
                ),

              ],
            )
          ];
        },
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[

              if(workout.length > 0)
                Expanded(child: ListView.builder(
                    itemCount: workout.length,
                    itemBuilder: (BuildContext context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(WorkoutDetail.routeName, arguments: jsonEncode(workout[index]));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.network(workout[index].imageUrl, width: 150, height: 100,),
                                SizedBox( width: 30),
                                Text(workout[index].name),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                )
              else
                Container(child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text("No Data")
                  ],
                )),



            ],
          ),
        ),

      ),


    );
  }
}
