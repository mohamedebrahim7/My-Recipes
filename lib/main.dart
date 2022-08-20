import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recpie_app/screens/home_screen.dart';
import 'data/moor/moor_repository.dart';
import 'data/repository.dart';
import 'data/sql/sqlite_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // you can choice to use sqflite db or Drift (moor) db

   //final repository = SqliteRepository();
  // await repository.init();

  // dont use repository.init() ;
  // with moor (drift) bec. of late initialization
  final repository = MoorRepository();

  runApp(MyApp(repository: repository));
}


class MyApp extends StatelessWidget {
  final Repository repository ;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),
        ),
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}