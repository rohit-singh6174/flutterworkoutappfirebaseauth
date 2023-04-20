import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/workout.dart';
import 'dart:convert';



class Cardlist extends StatefulWidget {
  const Cardlist({Key? key}) : super(key: key);

  static const String routeName ='/product-list';

  @override
  State<Cardlist> createState() => _CardlistState();

}

class _CardlistState  extends State <Cardlist> with TickerProviderStateMixin {

  List<Workout> products=[];


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
      products = list.map((e) => Workout.fromJson(e)).toList();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[

          if(products.length > 0)
            Expanded(child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments: jsonEncode(products[index]));
                      print("Hello");
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.network(products[index].imageUrl, width: 150, height: 100,),
                            SizedBox( width: 30),
                            Text(products[index].name),

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
            ))


        ],
      ),
    );

  }

}

