import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Project {
  Project({
    required this.label,
    required this.createdAt,
    required this.projectColor,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String label;
  final DateTime createdAt;
  final Color projectColor;
}
