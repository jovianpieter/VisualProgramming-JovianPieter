import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'SplitOrder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark, // Membuat latar jadi gelap tapi aksen hijau tetap ada
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const SplitBillScreen(),
    );
  }
}


