import 'package:flutter/material.dart';

class MobileNumberForm extends StatelessWidget {
  const MobileNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Continue with mobile number & OTP',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('+',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(' 94 ', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Perform action on button press
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
