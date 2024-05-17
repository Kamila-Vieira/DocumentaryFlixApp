import 'package:flutter/material.dart';
import 'package:documentary_flix/components/tag_filter.dart';

class CategoryFilter extends StatelessWidget {
  final List<TagFilter> categories;
  const CategoryFilter(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 35),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => categories[index],
      ),
    );
  }
}
