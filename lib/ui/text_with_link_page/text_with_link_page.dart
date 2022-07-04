import 'package:flutter/material.dart';
import 'package:shoryu_dev/ui/text_with_link_page/text_with_link.dart';

class TextWithLinkPage extends StatelessWidget {
  const TextWithLinkPage({super.key});

  static const routePath = '/textWithLink';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text With Link'),
        ),
        body: const Center(
          child: TextWithLink(
            text: Text(
              'いえーい'
              '\n'
              'http://pokemon-matome.net/'
              '\n'
              'https://twitter.com/home?lang=ja',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
