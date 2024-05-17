import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/utils/helpers.dart';
import 'package:pos_portal/widgets/counter.dart';

class CardList extends StatefulWidget {
  final Function(int, int) onSelectionChanged;

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
  final int itemPrice = 10000;
  int selectedCount = 0;
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the isClickedList with default values
    isClickedList = List.generate(10, (index) => false);
    itemQuantities = List.generate(10, (index) => 1);
  }

  void updateSelectedCount() {
    selectedCount = isClickedList.where((clicked) => clicked).length;
    totalAmount = 0;
    for (int i = 0; i < isClickedList.length; i++) {
      if (isClickedList[i]) {
        totalAmount += itemPrice * itemQuantities[i];
      }
    }
    widget.onSelectionChanged(selectedCount, totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 24),
      height: MediaQuery.of(context).size.height * 0.72,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final String itemName = "Es Lemon Tea";

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
                    isClickedList[index] = !isClickedList[index];
                    updateSelectedCount();
                  });
                },
                child: ListTile(
                  title: Text(
                    itemName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    'Rp ${formatRupiah(itemPrice)}',
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
        itemCount: 10, // Change this to the actual number of items you have
      ),
    );
  }
}
