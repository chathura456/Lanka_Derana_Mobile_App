import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lanka_derana/data/constants/business_hours_option.dart';
import 'package:lanka_derana/data/dataProviders/category_data.dart';
import 'package:lanka_derana/data/loaded_data/data.dart';
import 'package:lanka_derana/presentation/widgets/posting_ad_pageviews/rich_text_area.dart';

import '../../../data/models/category.dart';
import 'image_input.dart';

class BasicInfoForm extends StatefulWidget {
  const BasicInfoForm({super.key, required this.item});

  final Category item;

  @override
  State<StatefulWidget> createState() {
    return _BasicInfoFormState();
  }
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  bool isUserInfoForm = false;
  bool _isAgreedTerms = false;

  String? _selectedOption;
  String? _selectedAdType;
  String? _selectedPriceType;
  String? _selectedCurrency;
  String? _selectedItemCondition;
  String? _selectedItemWarranty;

  File? _selectedImage1;
  File? _selectedImage2;
  File? _selectedImage3;
  File? _selectedImage4;
  File? _selectedImage5;

  String? _selectedDistrict;
  List<String>? subCategories;

  BusinessHoursOption _selectedBusinessHoursOption = BusinessHoursOption.NA;

  @override
  void initState() {
    selectCategory();
    super.initState();
  }

  void selectCategory() {
    Category? desiredCategory = categoryList.firstWhere(
      (category) => category.title == widget.item.title,
    );

    if (desiredCategory != null) {
      subCategories = desiredCategory.subCategories;
    }
  }

  final List<String> customOptions = [
    'Airconditions & Electrical Fittings ',
    'Audio& MP3',
    'Computer Accessories',
    'Computers & Tablets',
    'Electronic home Appliances',
    'Mobile Phone Accessories',
    'Mobile Phones',
    'Other Electronics',
    'TV & Video Accessories',
    'TVs',
    'Video Games & Consoles',
  ];

  final List<String> _adTypes = [
    'Buy',
    'Education',
    'Exchange',
    'Job Offer',
    'Lost & Found',
    'Need',
    'Rent',
    'Rent/ Daily',
    'Rent/ Monthly',
    'Repairs',
    'Sell',
    'Services',
    // Add more options as needed
  ];

  final List<String> _priceTypes = [
    'Price On Call',
    'Negotiable',
    'Fixed',
    'Free',
    // Add more options as needed
  ];

  final List<String> _currencies = [
    'Rs', // Add more currency options as needed
  ];

  final List<String> _itemConditions = [
    'New',
    'Used',
    // Add more options as needed
  ];

  final List<String> _itemWarranties = [
    'No',
    'Yes',
    // Add more options as needed
  ];

  @override
  Widget build(BuildContext context) {
    Widget content = ListView(
      shrinkWrap: true,
      children: [
        const ListTile(
          leading: Icon(Icons.category),
          title: Text('Item Information'),
        ),
        DropdownButtonFormField<String>(
          value: _selectedOption,
          hint: const Text('Select a most suitable option'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue;
            });
          },
          items: subCategories!.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Title *',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Ad Description',
          style: TextStyle(fontSize: 16),
        ),
        const RichTextArea(),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: _selectedAdType,
          hint: const Text('Type of Ad *'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedAdType = newValue!;
            });
          },
          items: _adTypes.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: _selectedPriceType,
          hint: const Text('Price Type *'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedPriceType = newValue!;
            });
          },
          items: _priceTypes.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: _selectedCurrency,
          hint: const Text('Currency *'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCurrency = newValue!;
            });
          },
          items: _currencies.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Price *',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: _selectedItemCondition,
          hint: const Text('Item Condition'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItemCondition = newValue!;
            });
          },
          items: _itemConditions.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField<String>(
          value: _selectedItemWarranty,
          hint: const Text('Item Warranty'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItemWarranty = newValue!;
            });
          },
          items: _itemWarranties.map((option) {
            return DropdownMenuItem<String>(value: option, child: Text(option));
          }).toList(),
        ),
        const SizedBox(height: 15),
        ImageInput(
          onPickImage: (File image) {
            _selectedImage1 = image;
          },
          labelName: 'Upload Image 1',
        ),
        const SizedBox(height: 10),
        ImageInput(
          onPickImage: (File image) {
            _selectedImage2 = image;
          },
          labelName: 'Upload Image 2',
        ),
        const SizedBox(height: 10),
        ImageInput(
          onPickImage: (File image) {
            _selectedImage3 = image;
          },
          labelName: 'Upload Image 3',
        ),
        const SizedBox(height: 10),
        ImageInput(
          onPickImage: (File image) {
            _selectedImage4 = image;
          },
          labelName: 'Upload Image 4',
        ),
        const SizedBox(height: 10),
        ImageInput(
          onPickImage: (File image) {
            _selectedImage5 = image;
          },
          labelName: 'Upload Image 5',
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Second Phone Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Third Phone Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Select Business Hours',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Column(
          children: [
            RadioListTile<BusinessHoursOption>(
              title: const Text('N/A'),
              value: BusinessHoursOption.NA,
              groupValue: _selectedBusinessHoursOption,
              onChanged: (value) {
                setState(() {
                  _selectedBusinessHoursOption = value!;
                });
              },
            ),
            RadioListTile<BusinessHoursOption>(
              title: const Text('Open 24/7'),
              value: BusinessHoursOption.Open24_7,
              groupValue: _selectedBusinessHoursOption,
              onChanged: (value) {
                setState(() {
                  _selectedBusinessHoursOption = value!;
                });
              },
            ),
            RadioListTile<BusinessHoursOption>(
              title: const Text('Selective Hours'),
              value: BusinessHoursOption.SelectiveHours,
              groupValue: _selectedBusinessHoursOption,
              onChanged: (value) {
                setState(() {
                  _selectedBusinessHoursOption = value!;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextButton.icon(
          onPressed: () {
            setState(() {
              isUserInfoForm = true;
            });
          },
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Next'),
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 230,
                0), // Replace Colors.blue with your desired color
            padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
          ),
        ),
        const SizedBox(height: 20),
      ],
    );

    if (isUserInfoForm) {
      content = ListView(
        shrinkWrap: true,
        children: [
          const ListTile(
            leading: Icon(Icons.face),
            title: Text('User Information'),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Your Name *',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Mobile Number*',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: _selectedDistrict,
            hint: const Text('District*'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDistrict = newValue!;
              });
            },
            items: districts.map((option) {
              return DropdownMenuItem<String>(
                  value: option, child: Text(option));
            }).toList(),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.streetAddress,
            decoration: const InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'If you want to make it featured then please have a look on Packages.',
            style: Theme.of(context).textTheme.bodyMedium!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _isAgreedTerms,
                onChanged: (value) {
                  setState(() {
                    _isAgreedTerms = value ?? false;
                  });
                },
              ),
              const Text('I agree to Terms & Conditions'),
            ],
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              // when submit clicked post ad
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Submit'),
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 230, 0),
              padding: const EdgeInsets.all(16.0),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
  }
}
