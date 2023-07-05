import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('dd/MM, HH:mm');
  return formatter.format(dateTime);
}
