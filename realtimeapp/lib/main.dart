import 'package:flutter/material.dart';
import 'package:realtimeapp/core/route/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realtime Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true
      ),
      home: const DataRouteScreen(),
    );
  }
}

