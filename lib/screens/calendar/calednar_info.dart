import 'package:flutter/material.dart';
import 'package:mypsy_app/shared/themes/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTime;

  final List<String> timeSlots = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM"
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
            children: [
              const Center(
                child: const Text("Sélectionner une date",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020),
                    lastDay: DateTime.utc(2030),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: const Text("Sélectionner une heure",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Center(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: timeSlots.map((time) {
                    bool isSelected = _selectedTime == time;
                    return ChoiceChip(
                      label: Text(time),
                      selected: isSelected,
                      selectedColor: AppColors.mypsyDarkBlue,
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: AppColors.mypsyDarkBlue),
                      onSelected: (_) {
                        setState(() {
                          _selectedTime = time;
                        });
                      },
                      labelStyle: TextStyle(
                        color:
                            isSelected ? Colors.white : AppColors.mypsyDarkBlue,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mypsyDarkBlue,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_selectedDay != null && _selectedTime != null) {
                      // Submit logic here
                    }
                  },
                  child: const Text(
                    "Confirmer",
                    style: TextStyle(color: AppColors.mypsyBgApp),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
