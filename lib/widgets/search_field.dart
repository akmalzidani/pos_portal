import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontFamily: 'Montserrat', fontSize: 17),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.primary),
        ),
        prefixIcon: Icon(Icons.search, color: MyColors.neutral),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: MyColors.tertiary,
        hintText: 'Cari',
      ),
    );
  }
}
