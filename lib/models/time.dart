class Time {
  final DateTime currentTime = DateTime.now();

  DateTime get currTime {
    return currentTime;
  }

  String get customDay {
    if (currentTime.day > 9) {
      return "${currentTime.day}";
    }

    return "0${currentTime.day}";
  }

  String get customMonth {
    if (currentTime.month > 9) {
      return "${currentTime.month}";
    }

    return "0${currentTime.month}";
  }

  String get customYear {
    return "${currentTime.year % 100}";
  }

  String get stringifyTime {
    if (currTime.hour >= 6 && currTime.hour < 12) {
      return 'Morning';
    } else if (currTime.hour >= 12 && currTime.hour < 15) {
      return 'Day';
    } else if (currTime.hour >= 15 && currTime.hour < 18) {
      return 'Afternoon';
    }

    return "Night";
  }
}
