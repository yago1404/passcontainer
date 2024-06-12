import 'package:passcontainer/data/models/pass/pass.dart';

import 'key_type.dart';

class SocialNetwork implements IPass {
  @override
  final String password;

  @override
  final String id;

  @override
  final String name;

  final String key;
  final KeyType keyType;

  const SocialNetwork({
    required this.id,
    required this.password,
    required this.name,
    required this.key,
    required this.keyType,
  });
}
