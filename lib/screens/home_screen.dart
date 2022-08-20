import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recpie_app/screens/insert_recipe_screen.dart';
import '../data/repository.dart';
import '../widget/recipe_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Recipe App")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InsertRecipeScreen()),
          );
        },
        child: Icon(Icons.add),

      ),
      body: const SafeArea(child: MyRecipesList()),
    );
  }
}


