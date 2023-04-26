
import 'package:isar/isar.dart';

import 'counter_model.dart';

part 'counter_manager_model.g.dart';

@collection
class CounterManager {
  final Id id = Isar.autoIncrement;
  late String name;
  final counters = IsarLinks<Counter>();
}