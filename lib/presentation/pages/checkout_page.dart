import 'package:flutter/material.dart';
import 'package:lanka_derana/data/dataProviders/cart_data.dart';

import '../../data/models/order_details.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CheckoutPageState();
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Controller for text fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // PageController to control the page view
  final PageController _pageController = PageController(initialPage: 0);

  bool _shipToDifferentAddress = false;
  final List<OrderDetails> _cartItems = cartList;
  double subTotal = 0;
  final total = 0;
  int _paymentOption = 1;

  @override
  void initState() {
    super.initState();
    subTotal =
        _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  void dispose() {
    // Dispose the text field controllers and the page controller
    firstNameController.dispose();
    lastNameController.dispose();
    streetAddressController.dispose();
    stateController.dispose();
    cityController.dispose();
    postcodeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // Function to go to the next page
  void _goToNextPage() {
    if (_pageController.page != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_pageController.page != null) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
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
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // Disable swiping between pages
        children: [
          _buildBillingDetailsStep(),
          _buildPaymentDetailsStep(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _goToPreviousPage,
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 255, 230, 0),
                ),
              ),
              child: const Text('Previous'),
            ),
            ElevatedButton(
              onPressed: _goToNextPage,
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 255, 230, 0),
                ),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Step 1: Billing Details
  Widget _buildBillingDetailsStep() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Billing Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Country / Region',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Street Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'State (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Postcode / ZIP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Order notes (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            CheckboxListTile(
              title: const Text('Ship to a different address?'),
              value: _shipToDifferentAddress,
              onChanged: (value) {
                setState(() {
                  _shipToDifferentAddress = value!;
                });
              },
            ),
            if (_shipToDifferentAddress)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Shipping Details',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Country / Region',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Street Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'State (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Postcode / ZIP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailsStep() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'Your Order',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  OrderDetails cartItem = _cartItems[index];
                  return ListTile(
                    title: Text(
                      cartItem.product,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(
                      'Quantity: ${cartItem.quantity}',
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    trailing: Text(
                      'රු ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            child: ListTile(
              title: Text(
                'Subtotal',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'රු${subTotal.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              title: Text(
                'Total',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              trailing: Text(
                'රු${subTotal.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Payment options
          const ListTile(
            title: Text(
              'Payment Options',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile<int>(
            title: const Text('Direct bank transfer'),
            value: 1,
            groupValue: _paymentOption,
            onChanged: (value) {
              setState(() {
                _paymentOption = value!;
              });
            },
          ),
          // Description for the first option
          Card(
            margin: const EdgeInsets.only(right: 30, left: 50),
            child: Visibility(
              visible: _paymentOption == 1,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your ad will not be published until the funds have cleared in our account.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          RadioListTile<int>(
            title: const Text('Onepay'),
            value: 2,
            groupValue: _paymentOption,
            onChanged: (value) {
              setState(() {
                _paymentOption = value!;
              });
            },
          ),
          // Description for the 2nd option
          Card(
            margin: const EdgeInsets.only(right: 30, left: 50),
            child: Visibility(
              visible: _paymentOption == 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo_onepay.png',
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Pay by Visa, MasterCard, AMEX, or Lanka QR via onepay.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your personal data will be used to process your order, support your experience throughout this website,and for other purposes described in our privacy policy.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: ElevatedButton(
              onPressed: () {
                // Implement your purchase logic here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text(
                'Purchase Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
