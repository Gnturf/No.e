class Time {
  final DateTime currentTime = DateTime.now();

  DateTime get currTime {
    return currentTime;
  }

  DateTime get endOfTheDayTime {
    var day = currTime.day;
    var month = currTime.month;
    var year = currTime.year;

    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime get tomorrowTime {
    return currentTime.add(const Duration(days: 1));
  }

  DateTime get nextWeekTime {
    return currentTime.add(const Duration(days: 7));
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
