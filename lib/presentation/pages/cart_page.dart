import 'package:flutter/material.dart';
import 'package:lanka_derana/data/models/order_details.dart';

import '../../data/dataProviders/cart_data.dart';
import '../widgets/cartPage/coupon_code.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  double get _totalAmount =>
      cartList.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color of the back button here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                OrderDetails cartItem = cartList[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(cartItem.product),
                  subtitle:
                      Text('Price: Rs ${cartItem.price.toStringAsFixed(2)}'),
                  trailing: Text('Quantity: ${cartItem.quantity}'),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: Rs $_totalAmount',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                const CouponCode(), // Add the CouponCode widget here
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutPage(),
                        ));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 255, 230, 0),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
