import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AthenType { login, register }

final authmodeProvider = StateProvider<AthenType>((ref) {
  return AthenType.register;
});
