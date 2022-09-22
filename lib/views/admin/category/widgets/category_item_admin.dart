import 'package:flutter/material.dart';

import '../../../../data/models/category/category_item.dart';

class CategoryItemAdmin extends StatelessWidget {
  const CategoryItemAdmin({
    Key? key,
    required this.onDeleteTap,
    required this.onUpdateTap,
    required this.categoryItem,
  }) : super(key: key);

  final VoidCallback onDeleteTap;
  final VoidCallback onUpdateTap;
  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          categoryItem.categoryImg,
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        categoryItem.categoryName,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        categoryItem.description,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        width: 96,
        child: Row(
          children: [
            IconButton(
                onPressed: onUpdateTap,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                )),
            IconButton(
              onPressed: onDeleteTap,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
      shape: const Border(
        bottom: BorderSide(),
      ),
    );
  }
}
