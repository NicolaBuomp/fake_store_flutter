import 'package:fake_store_flutter/common/widgets/appbar/appbar.dart';
import 'package:fake_store_flutter/features/shop/screens/orders/widgets/order_list_items.dart';
import 'package:fake_store_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text(
          'I miei ordini',
          style: Theme.of(context).textTheme.headlineSmall,

        ),
      ),
      body: const Padding(padding: EdgeInsets.all(Sizes.defaultSpace), child: OrderListItems(),),
    );
  }
}
