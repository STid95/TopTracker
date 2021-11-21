import 'package:flutter/material.dart';
import 'package:top_tracker/views/chooseArtist.dart';
import 'package:top_tracker/views/home.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        title: 'TopTracker',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/chooseArtist': (context) => const ChooseArtist(),
        },
      ),
    );
