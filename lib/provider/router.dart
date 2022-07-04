import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoryu_dev/ui/aws/amplify_auth_page.dart';
import 'package:shoryu_dev/ui/custom_render_object_page/custom_render_object_page.dart';
import 'package:shoryu_dev/ui/home_page.dart';
import 'package:shoryu_dev/ui/lottie_page.dart';
import 'package:shoryu_dev/ui/prefs_page.dart';
import 'package:shoryu_dev/ui/slider_page.dart';
import 'package:shoryu_dev/ui/text_with_link_page/text_with_link_page.dart';
import 'package:shoryu_dev/ui/video_page/video_page.dart';

final routerProvider = Provider((_) => _Router.router);

class _Router {
  const _Router();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: SharedPreferencesPage.routePath,
        builder: (context, state) => const SharedPreferencesPage(),
      ),
      GoRoute(
        path: VideoPage.routePath,
        builder: (context, state) => const VideoPage(),
      ),
      GoRoute(
        path: SliderPage.routePath,
        builder: (context, state) => const SliderPage(),
      ),
      GoRoute(
        path: TextWithLinkPage.routePath,
        builder: (context, state) => const TextWithLinkPage(),
      ),
      GoRoute(
        path: LottiePage.routePath,
        builder: (context, state) => const LottiePage(),
      ),
      GoRoute(
        path: CustomRenderObjectPage.routePath,
        builder: (context, state) => const CustomRenderObjectPage(),
      ),
      GoRoute(
        path: AmplifyAuthPage.routePath,
        builder: (context, state) => const AmplifyAuthPage(),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
