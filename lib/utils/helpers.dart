import 'dart:ui';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:pos_portal/utils/colors.dart';

String formatRupiah(int nominal) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: '',
    decimalDigits: 0,
  ).format(nominal);
}

Color getColorByStock(int? stock) {
  // if (stock <= 3) {
  //   return MyColors.error;
  // } else if (stock <= 10) {
  //   return MyColors.warning;
  // } else {
  //   return MyColors.primary;
  // }
  if(stock == null || stock > 10) {
    return MyColors.primary;
  } else if(stock > 3) {
    return MyColors.warning;
  } else {
    return MyColors.error;
  }
}