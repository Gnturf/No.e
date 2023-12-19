import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  Task({
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.deadline,
    this.isFinished = false,
    this.finishedAt,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final String desc;
  final DateTime createdAt;
  final DateTime deadline;
  bool isFinished;
  DateTime? finishedAt;

  String getDeadlineString(DateTime currTime) {
    var currDate = DateTime(currTime.year, currTime.month, currTime.day);
    var dlDate = DateTime(deadline.year, deadline.month, deadline.day);
    var difference = dlDate.difference(currDate);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Tomorrow';
    } else if (difference.inDays < 0) {
      return 'Missed';
    }

    return 'In ${difference.inDays} days';
  }
}
