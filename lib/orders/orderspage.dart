// ignore_for_file: non_constant_identifier_names, unnecessary_string_escapes

import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  final String itemName;
  final double price;
  final String imageUrl;

  const OrdersPage({
    required this.itemName,
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _CustomerNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _CustomerNameController.dispose();
    _locationController.dispose();
    _DescriptionController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    setState(() {
      _totalPrice = quantity * widget.price;
    });
  }

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      // You can process the order submission here, call an API, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order submitted for ${widget.itemName}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Orders Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Image
              Center(
                child: Image.network(
                  widget.imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),

              // Display Item Name and Price
              Text(
                'Item: ${widget.itemName}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Price: \MWK${widget.price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              // Location Field
              TextFormField(
                controller: _CustomerNameController,
                decoration: const InputDecoration(
                  labelText: 'CustomerName',
                  hintText: 'eg .peter banda,jane',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Quantity Field
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Location Field
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  hintText: 'eg flatsF19,Tchaka 12,chikanda petit',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Description Field
              TextFormField(
                controller: _DescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  hintText: 'eg deliver it fast please',
                  border: OutlineInputBorder(),
                ),
                // No validation required since this field is optional
              ),
              const SizedBox(height: 16.0),

              // Phone Number Field
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Total Price Calculation
              Text(
                'Total: \MWK${_totalPrice.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Set the button color to green
                  ),
                  child: const Text(
                    'Continue and Pay',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
