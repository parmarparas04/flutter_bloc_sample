import 'package:bloc_sample/home/home.dart';
import 'package:bloc_sample/network/fakeapi.dart';
import 'package:bloc_sample/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => FakeApiService(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
