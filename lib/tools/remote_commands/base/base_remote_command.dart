
import 'package:flutter/material.dart';

abstract class BaseRemoteCommand with ChangeNotifier {
  String name;
  bool isRunning = false;
  
  BaseRemoteCommand({
    required this.name,
  });

  Future<void> execute() async {
    if (isRunning) return;
    isRunning = true;
    notifyListeners();
    try {
      await onExecute();
    } catch (e) {
      print(e);
    }
    isRunning = false;
    notifyListeners();
  }

  Future<void> onExecute();
}