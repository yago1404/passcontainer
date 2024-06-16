import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppStorage {
  final Box _box;

  AppStorage(Box box): _box = box;

  static Future<AppStorage> init() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
    Box box = await Hive.openBox('passcontainer');
    return AppStorage(box);
  }

  String? getByKey(String key) {
    return _box.get(key);
  }

  void setByKey(String key, String value) {
    _box.put(key, value);
  }

  void removeByKey(String key) {
    _box.delete(key);
  }

  void clear() {
    _box.clear();
  }
}