import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:pos_portal/utils/colors.dart';

import '../models/Product.dart';
import '../pages/product/product_action.dart';
import '../utils/helpers.dart';


class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                PersistentNavBarNavigator.pushNewScreen(context, screen: ProductAction(idProduct: product.id),withNavBar: false,pageTransitionAnimation: PageTransitionAnimation.cupertino);
            },
            child: ListTile(
              title: Text(
                product.name,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                formatRupiah(product.price.toInt()),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: MyColors.primary,
                ),
              ),
              trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Stock : ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: getColorByStock(product.stockType == 0 ? null : product.stock),
                        ),
                      ),
                      Text(
                        (product.stockType == 0) ? 'ထ' : product.stock.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: getColorByStock(product.stockType == 0 ? null : product.stock),
                        ),
                      )
                    ]
                  )),
            ),
          ),
        ));
  }
}
