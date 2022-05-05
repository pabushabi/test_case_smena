import 'package:flutter/material.dart';
import 'package:test_case_smena/core/models/product.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({
    Key? key,
    required this.product,
    required this.onTapDelete,
  }) : super(key: key);

  final Product product;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12.withOpacity(0.04),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  product.imageUrl,
                  width: 59,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(
                      "${product.cost} ₽",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(product.sizes),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onTapDelete,
                  icon: const Icon(Icons.delete_outline),
                ),
                Text("${product.count} шт."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
