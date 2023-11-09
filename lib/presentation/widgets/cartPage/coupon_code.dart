import 'package:flutter/material.dart';

class CouponCode extends StatefulWidget {
  const CouponCode({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CouponCodeState();
  }
}

class _CouponCodeState extends State<CouponCode> {
  String _couponCode = '';

  void _applyCoupon() {
    if (_couponCode.isNotEmpty) {
      // widget.onApplyCoupon?.call(_couponCode);
    }
  }

  void _removeCoupon() {
    setState(() {
      _couponCode = '';
    });
    // widget.onRemoveCoupon?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              _couponCode = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter coupon code',
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.primary), // Change hint text color to blue
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary), // Change border color to blue
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary), // Change enabled border color to blue
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary), // Change focused border color to blue
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _applyCoupon,
          child: const Text('Apply Coupon'),
        ),
        if (_couponCode.isNotEmpty)
          ElevatedButton(
            onPressed: _removeCoupon,
            child: const Text('Remove Coupon'),
          ),
      ],
    );
  }
}
