import 'package:firebase_auth_part/data/models/category/category_item.dart';
import 'package:flutter/material.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({Key? key, required this.categoryItem}) : super(key: key);

  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 77,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(spreadRadius: 6, blurRadius: 5, offset: const Offset(3, 4), color: Colors.grey.withOpacity(0.3)),
        ]),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              categoryItem.categoryImg,
              width: 80,
              height: 77,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categoryItem.categoryName,
                  style: const TextStyle(fontWeight: FontWeight.bold).copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        categoryItem.description,
                        style: const TextStyle(fontWeight: FontWeight.w400).copyWith(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
