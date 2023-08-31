import 'package:classic_eccomerce/blogs/presentation/widgets/blog_item.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.renderAppBar(title: "Blog"),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),

        itemBuilder: (context, index) {
          return const BlogItem();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: 6,
      ),
    ));
  }
}
