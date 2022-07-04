import 'package:flutter/material.dart';
import 'package:shoryu_dev/ui/custom_render_object_page/custom_render_object_widget.dart';

class CustomRenderObjectPage extends StatelessWidget {
  const CustomRenderObjectPage({super.key});

  static const routePath = '/renderObject';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Render Object'),
      ),
      body: const Center(
        child: CustomRenderObjectWidget(),
      ),
    );
  }
}
