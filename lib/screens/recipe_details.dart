import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/recipe.dart';
import '../../data/repository.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final repository = Provider.of<Repository>(context);
    final ingredients = recipe.ingredients ?? [] ;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.label!),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: recipe.image ?? '',
                    height: height * 0.25,
                    width: width,
                    fit: BoxFit.cover),
                SizedBox(
                  height: height * 0.01,
                ),
                Center(
                  child: Text("Number of Ingredients : ${ingredients.length}",
                      style: TextStyle(color: Colors.deepPurpleAccent , fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Ingredient name : ${ ingredients[index].name}'),
                      subtitle: Text('Ingredient weight : ${ ingredients[index].weight}'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
