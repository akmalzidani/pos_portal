import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/counter.dart';

class CardList extends StatefulWidget {
  final Function(List<Map<String, dynamic>>, int) onSelectionChanged;

  CardList({
    Key? key,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late List<bool> isClickedList;
  late List<int> itemQuantities;
  final List<Map<String, dynamic>> items = [
    {'name': 'Es Lemon Tea', 'price': 10000},
    {'name': 'Nasi Goreng', 'price': 20000},
    {'name': 'Ayam Bakar', 'price': 25000},
    {'name': 'Mie Goreng', 'price': 15000},
    {'name': 'Es Teh Manis', 'price': 5000},
    {'name': 'Kopi Hitam', 'price': 8000},
    {'name': 'Soto Ayam', 'price': 18000},
    {'name': 'Bakso', 'price': 12000},
    {'name': 'Sate Ayam', 'price': 22000},
    {'name': 'Gado-Gado', 'price': 14000},
  ];

  List<Map<String, dynamic>> selectedItems = [];
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    isClickedList = List.generate(items.length, (index) => false);
    itemQuantities = List.generate(items.length, (index) => 1);
  }

  void updateSelectedCount() {
    selectedItems = [];
    totalAmount = 0;
    for (int i = 0; i < isClickedList.length; i++) {
      if (isClickedList[i]) {
        totalAmount += (items[i]['price'] as int) * itemQuantities[i];
        selectedItems.add({
          'name': items[i]['name'],
          'price': items[i]['price'],
          'quantity': itemQuantities[i]
        });
      }
    }
    widget.onSelectionChanged(selectedItems, totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 24),
      height: MediaQuery.of(context).size.height * 0.72,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: MyColors.secondaryDisabled,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (isClickedList[index]) {
                      isClickedList[index] = false;
                      itemQuantities[index] = 1;
                    } else {
                      isClickedList[index] = true;
                    }
                    updateSelectedCount();
                  });
                },
                child: ListTile(
                  title: Text(
                    item['name'],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    'Rp ${formatRupiah(item['price'])}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: MyColors.primary,
                    ),
                  ),
                  trailing: isClickedList[index]
                      ? SizedBox(
                          width: 100,
                          child: Counter(
                            initialValue: itemQuantities[index],
                            onChanged: (value) {
                              setState(() {
                                itemQuantities[index] = value;
                                updateSelectedCount();
                              });
                            },
                          ),
                        )
                      : SizedBox(),
                ),
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
