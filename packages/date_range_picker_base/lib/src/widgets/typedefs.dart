import 'package:flutter/material.dart';
import '../../../date_range_picker_base.dart';

/// A function that builds a widget that will be used to display the selected date range.
typedef DateRangerPickerWidgetBuilder = Widget Function(
  BuildContext context,
  void Function(DateRange? dateRange) onDateRangeChanged,
);
