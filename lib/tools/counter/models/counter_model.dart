
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:toolbox/tools/counter/models/counter_manager_model.dart';

part 'counter_model.g.dart';

@collection
class Counter with ChangeNotifier {
  final Id id = Isar.autoIncrement;
  late String? name;
  late int value;

  @Backlink(to: 'counters')
  final counterManager = IsarLink<CounterManager>();
}