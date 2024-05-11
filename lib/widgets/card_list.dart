import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';
import 'package:pos_portal/widgets/counter.dart';

class CardList extends StatefulWidget {
  late int jumlahItem = 1;

  CardList({
    super.key,
  });

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late List<bool> isClickedList;

  @override
  void initState() {
    super.initState();
    // Initialize the isClickedList with default values
    isClickedList = List.generate(10, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 24),
      height: MediaQuery.of(context).size.height * 0.72,
      child: ListView.builder(
        itemBuilder: (context, index) {
          // Replace this with your actual data retrieval logic
          final String itemName = "Es Lemon Tea";
          final String itemPrice = "Rp 10.000";

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
                    itemPrice,
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
                            initialValue: widget.jumlahItem,
                            onChanged: (value) {
                              setState(() {
                                widget.jumlahItem = value;
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
