import 'package:date_range_picker_base/date_range_picker_base.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date range picker example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Date range picker example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateRange? selectedDateRange = DateRange(
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('The simple field example:'),
            Container(
              padding: const EdgeInsets.all(8),
              width: 250,
              child: DateRangeField(
                decoration: const InputDecoration(
                  label: Text('Date range picker'),
                  hintText: 'Please select a date range',
                ),
                onDateRangeSelected: (DateRange? value) {
                  setState(() {
                    selectedDateRange = value ?? selectedDateRange;
                  });

                  debugPrint('selectedDateRange : ${selectedDateRange?.start}');
                  debugPrint('selectedDateRange : ${selectedDateRange?.end}');
                },
                selectedDateRange: selectedDateRange,
                pickerBuilder: (context, onDateRangeChanged) {
                  return datePickerBuilder(context, onDateRangeChanged);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget datePickerBuilder(
    BuildContext context,
    ValueChanged<DateRange?> onDateRangeChanged, [
    bool doubleMonth = true,
  ]) {
    return DateRangePickerWidget(
      doubleMonth: doubleMonth,
      maximumDateRangeLength: 180,
      quickDateRanges: [
        QuickDateRange(
          label: 'Today',
          dateRange: DateRange(
            DateTime.now(),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'Yesterday',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 1)),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'This week',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 30)),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'Last week',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 90)),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'This month',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 180)),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'Last month',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 180)),
            DateTime.now(),
          ),
        ),
        QuickDateRange(
          label: 'Last 7 days',
          dateRange: DateRange(
            DateTime.now().subtract(const Duration(days: 7)),
            DateTime.now(),
          ),
        ),
      ],
      initialDateRange: selectedDateRange,
      initialDisplayedDate: selectedDateRange?.start ?? DateTime.now(),
      onDateRangeChanged: onDateRangeChanged,
    );
  }
}
