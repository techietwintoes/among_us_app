import 'package:among_us_app/globals.dart';
import 'package:among_us_app/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Among Us Avatar Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => RVProvider(),
        )
      ], child: HomePage()),
    );
  }
}
