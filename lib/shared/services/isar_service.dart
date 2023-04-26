
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toolbox/tools/counter/models/counter_manager_model.dart';
import 'package:toolbox/tools/counter/models/counter_model.dart';

class IsarService {
  late Future<Isar> database;

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [CounterManagerSchema, CounterSchema], 
        inspector: true, 
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}