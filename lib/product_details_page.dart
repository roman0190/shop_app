import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              product['imageUrl'] as String,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                Text(
                  '\$${product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemCount: (product['sizes'] as List<double>).length,
                  itemBuilder: (context, index) {
                    final size = (product['sizes'] as List<double>)[index];
                    return Chip(
                      label: Text('$size'),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
