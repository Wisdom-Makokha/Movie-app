import 'package:flutter/material.dart';
import 'package:mile_2/Screens/movie_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main()async
{
  runApp(const MyMovieApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyMovieApp extends StatelessWidget{
  const MyMovieApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Our Movie App',
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
        colorScheme: const ColorScheme.dark(brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: MovieScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}