import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMoviesApp());
}

class ResponsiveMoviesApp extends StatelessWidget {
  const ResponsiveMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Movies App',
      home: Scaffold(),
    );
  }
}
