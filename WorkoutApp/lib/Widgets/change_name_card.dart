import 'package:flutter/material.dart';

import 'bgimage.dart' show BgImage;

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key? key,
    required this.mytxt,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController, super(key: key);

  final String mytxt;
  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BgImage(),
        SizedBox(
          height: 20,
        ),

        Text(mytxt,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

        SizedBox(
          height: 20,
        ),

        Padding(padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
                hintText: "Enter you Username",
                labelText: "Username",
                border: OutlineInputBorder()),
          ),
        ),


      ],
    );
  }
}