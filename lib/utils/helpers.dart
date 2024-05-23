import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

String formatRupiah(int nominal) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: '',
    decimalDigits: 0,
  ).format(nominal);
}

class SnackbarManager {
  static final SnackbarManager _instance = SnackbarManager._internal();

  factory SnackbarManager() {
    return _instance;
  }

  SnackbarManager._internal();

  bool _isSnackbarVisible = false;

  bool get isSnackbarVisible => _isSnackbarVisible;
  set isSnackbarVisible(bool visible) {
    _isSnackbarVisible = visible;
  }
}
