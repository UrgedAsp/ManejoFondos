import 'package:intl/intl.dart';

class FormatCurrency {
  final formatter = NumberFormat.currency(
    locale: 'es_CL',
    symbol: '\$',
    decimalDigits: 0,
    customPattern: '\u00A4#,##0',
  );

  String formatCOP(double value) {
    return formatter.format(value);
  }
}
