import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/label_transaction.dart';

class CardListTransaction extends StatefulWidget {
  final List<Map<String, dynamic>> transactions;
  CardListTransaction({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  State<CardListTransaction> createState() => _CardListTransactionState();
}

class _CardListTransactionState extends State<CardListTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 24),
      height: MediaQuery.of(context).size.height * 0.72,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final transaction = widget.transactions[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFE0E8F2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.secondaryDisabled,
                  ),
                  height: 46.48,
                  width: 46.48,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/svg/icon_duit.svg',
                      height: 20,
                    ),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp ${formatRupiah(transaction['totalTransaksi'])}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'ID Transaksi',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11,
                            color: Color(0x9926273A),
                          ),
                        ),
                        Text(
                          transaction['idTransaksi'],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LabelTransaksi(
                          isBatal: !transaction['isBerhasil'],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          transaction['tglTransaksi'],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11,
                            color: Color(0x9926273A),
                          ),
                        ),
                        Text(
                          transaction['jamTransaksi'],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11,
                            color: Color(0x9926273A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget.transactions.length,
      ),
    );
  }
}
