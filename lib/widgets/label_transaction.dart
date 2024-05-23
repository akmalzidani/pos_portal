import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';

class LabelTransaksi extends StatelessWidget {
  final bool? isBatal;
  const LabelTransaksi({
    super.key,
    this.isBatal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isBatal! ? MyColors.bgError : MyColors.bgSuccess,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        isBatal! ? 'Dibatalkan' : 'Berhasil',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 9,
          color: isBatal! ? MyColors.error : MyColors.success,
        ),
      ),
    );
  }
}
