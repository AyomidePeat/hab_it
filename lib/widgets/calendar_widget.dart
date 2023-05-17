import 'dart:async';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CalenderWidget extends StatefulWidget {
  final Color color;

  const CalenderWidget({super.key, required this.color});
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  late Map<DateTime, List> _events;
  var _calendarFormat = CalendarFormat.week;
  late StreamController<DateTime> selectedDateStreamController;

  @override
  void initState() {
    super.initState();

    _events = {};
    selectedDateStreamController = StreamController<DateTime>();
  }

  var _selectedDay;
  var _focusedDay;
  onDaySelected(DateTime day, List date) {
    setState(() {
      selectedDateStreamController.add(day);
    });
    return day.toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TableCalendar(
      headerVisible: false,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, focusedDay) => Container(
          margin: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
          child: Text(
            focusedDay.day.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        selectedBuilder: (context, day, focusedDay) => Container(
          margin: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: lightGreen,
            shape: BoxShape.circle,
          ),
          child: Text(
           day.day.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        defaultBuilder: (
          context,
          date,
          events,
        ) =>
            Container(
          margin: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: grey,
            shape: BoxShape.circle,
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      calendarStyle: CalendarStyle(
        cellPadding: const EdgeInsets.all(3.0),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(day, _selectedDay);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = selectedDay;
        });
      },
    );
  }
}
