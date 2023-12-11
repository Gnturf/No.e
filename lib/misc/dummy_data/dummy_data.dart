import 'package:no_e/models/task.dart';
import 'package:no_e/models/user.dart';

const user = User(
  firstName: 'Guntur',
  lastName: 'Firmansyah',
  profileURL:
      'https://i.scdn.co/image/ab67616d0000b273c716f0361f9ed5a8f4b78d80',
);

final taskDummy = <Task>[
  Task(
    title: 'Creating Wireframe',
    createdAt: DateTime.now(),
    deadline: DateTime(2023, 12, 10),
    isFinished: false,
  ),
  Task(
    title: 'Creating Mockups',
    createdAt: DateTime.now(),
    deadline: DateTime(2023, 12, 11),
    isFinished: false,
  ),
  Task(
    title: 'Creating Prototyping',
    createdAt: DateTime.now(),
    deadline: DateTime(2023, 12, 12),
    isFinished: false,
  ),
];
