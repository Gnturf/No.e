import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/models/time.dart';

final timeProvider = Provider((ref) {
  return Time();
});
