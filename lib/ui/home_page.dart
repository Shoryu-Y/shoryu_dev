import 'package:flutter/material.dart';
import 'package:shoryu_dev/ui/aws/amplify_auth_page.dart';
import 'package:shoryu_dev/ui/custom_render_object_page/custom_render_object_page.dart';
import 'package:shoryu_dev/ui/lottie_page/lottie_page.dart';
import 'package:shoryu_dev/ui/shared_preferences_page/prefs_page.dart';
import 'package:shoryu_dev/ui/slider_page/slider_page.dart';
import 'package:shoryu_dev/ui/text_with_link_page/text_with_link_page.dart';
import 'package:shoryu_dev/ui/video_page/video_page.dart';
import 'package:shoryu_dev/ui/widget/button/navigate_button.dart';
import 'package:shoryu_dev/ui/widget/center_layout_scroll_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: const CenterLayoutScrollView(
          children: [
            NavigateButton(
              title: 'shared_preferences',
              path: SharedPreferencesPage.routePath,
            ),
            NavigateButton(
              title: 'video_player',
              path: VideoPage.routePath,
            ),
            NavigateButton(
              title: 'text with link',
              path: TextWithLinkPage.routePath,
            ),
            NavigateButton(
              title: 'slider',
              path: SliderPage.routePath,
            ),
            NavigateButton(
              title: 'lottie',
              path: LottiePage.routePath,
            ),
            NavigateButton(
              title: 'render_object',
              path: CustomRenderObjectPage.routePath,
            ),
            NavigateButton(
              title: 'AWS Amplify App',
              path: AmplifyAuthPage.routePath,
            ),
          ],
        ),
      ),
    );
  }
}
