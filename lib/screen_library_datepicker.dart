import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScreenLibraryDatePicker extends StatefulWidget {
  const ScreenLibraryDatePicker({super.key});

  @override
  State<ScreenLibraryDatePicker> createState() =>
      _ScreenLibraryDatePickerState();
}

class _ScreenLibraryDatePickerState extends State<ScreenLibraryDatePicker> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Choose a date Range',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                "${startDate != null ? DateFormat("EEE, M / d / y").format(startDate!) : 'MM/DD/YY'} to ${endDate != null ? DateFormat("EEE, M / d / y").format(endDate!) : 'MM/DD/YY'}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now(),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: endDate,
              startDate: startDate,
              backgroundColor: Colors.white,
              primaryColor: Colors.black,
              onApplyClick: (start, end) {
                setState(() {
                  endDate = end;
                  startDate = start;
                });
              },
              onCancelClick: () {
                setState(() {
                  endDate = null;
                  startDate = null;
                });
              },
            );
          },
          tooltip: 'choose date Range',
          child: const Icon(Icons.calendar_today_outlined, color: Colors.white),
        ),
      ),
    );
  }
}
