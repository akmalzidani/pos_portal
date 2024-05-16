import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';

class InputField extends StatefulWidget {
  final ValueChanged<int?> onUangDiterimaChanged;

  final String? label;
  final bool isDuit;
  final TextEditingController controller;

  InputField({
    super.key,
    this.label = '',
    this.isDuit = false,
    required this.controller,
    required this.onUangDiterimaChanged,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter.currency(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp ',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: (widget.label == '') ? 0 : 10),
          child: Text(
            widget.label ?? '',
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF525666)),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: MyColors.primary,
          keyboardType:
              widget.isDuit ? (TextInputType.number) : TextInputType.text,
          onChanged: (value) {
            if (value.isNotEmpty) {
              final valueHarga = formatter.getUnformattedValue();
              debugPrint('valueHarga ${valueHarga.toString()}');
              widget.onUangDiterimaChanged(valueHarga as int? ?? 0);
            }
          },
          inputFormatters: widget.isDuit
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  formatter
                ]
              : <TextInputFormatter>[],
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 17),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.neutral,
              ),
            ),
            hintText: '0',
            hintStyle: TextStyle(
              color: MyColors.neutral,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
