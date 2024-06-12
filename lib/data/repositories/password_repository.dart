import '../models/pass/pass.dart';

class PasswordRepository {
  List<IPass>? recent;

  Future<List<IPass>> findRecent() async {
    if (recent != null) {
      // TODO: async find in API and reload recent
      return recent!;
    }
    return [];
  }
}