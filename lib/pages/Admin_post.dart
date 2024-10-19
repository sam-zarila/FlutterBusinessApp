import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/markret_model.dart';
import '../services/Admin_posts.dart';

class PostMarket extends StatefulWidget {
  const PostMarket({super.key});

  @override
  State<PostMarket> createState() => _PostMarketState();
}

class _PostMarketState extends State<PostMarket> {
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final MarketService _marketService = MarketService();
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _postMarketItem() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final marketItem = MarkretModel(
        image: _imageController.text.trim(),
        name: _nameController.text.trim(),
        provider: _providerController.text.trim(),
        price: _priceController.text.trim(),
        location: _locationController.text.toString());

    final success = await _marketService.createMarketItem(marketItem);

    setState(() {
      _isLoading = false;
        if (success) {
       
        Navigator.pop(context); 
      } else {
        _errorMessage = 'Failed to post market item. Please try again.';
      }
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Market Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _providerController,
              decoration: const InputDecoration(labelText: 'Provider'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _postMarketItem,
                    child: const Text('Post Item'),
                  ),
          ],
        ),
      ),
    );
  }
}
