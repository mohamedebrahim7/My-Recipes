import 'dart:math' as math;

import 'package:flutter/material.dart';

class AddIngredientCard extends StatelessWidget {
  final TextEditingController nameController;

  final TextEditingController weightController;

  const AddIngredientCard({Key? key, required this.nameController, required this.weightController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
             controller: nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter  ingredient name',
                label: Text("Ingredient  name")),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
               controller: weightController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter ingredient weight ',
                label: Text("Ingredient weight")),

          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
