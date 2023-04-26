
import 'package:flutter/material.dart';
import 'package:toolbox/views/home/home_view.dart';

class ToolboxApp extends StatefulWidget {
  const ToolboxApp({super.key});

  @override
  State<ToolboxApp> createState() => _ToolboxAppState();
}

class _ToolboxAppState extends State<ToolboxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toolbox",
      theme: ThemeData.dark(useMaterial3: true),
      home: HomeView(),
    );
  }
}