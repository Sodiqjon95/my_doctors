import 'package:firebase_auth_part/data/models/category/category_item.dart';
import 'package:firebase_auth_part/views/admin/category/widgets/category_item_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category/update_arguments.dart';
import '../../../utils/constanta.dart';
import '../../../view_models/category_view_model.dart';

class CategoryAdminPage extends StatelessWidget {
  const CategoryAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, addCategory),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<CategoryItem>>(
        stream: context.read<CategoryViewModel>().getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return categories.isNotEmpty
                ? ListView(
                    children: List.generate(
                      categories.length,
                      (index) => CategoryItemAdmin(
                        onDeleteTap: () {
                          context.read<CategoryViewModel>().deleteCategory(
                                context: context,
                                docId: categories[index].categoryId,
                              );
                        },
                        categoryItem: categories[index],
                        onUpdateTap: () => Navigator.pushNamed(
                          context,
                          updateCategory,
                          arguments: UpdateCategoryArgs(
                            categoryItem: categories[index],
                            docId: categories[index].categoryId,
                          ),
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text("list empty"),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
