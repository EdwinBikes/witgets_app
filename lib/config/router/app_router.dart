import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/page_web_portfolio/page_web_porfolio.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:widgets_app/presentation/screens/triqui/triqui.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/counter',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/controlsUI',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      path: '/scroll',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/theme',
      name: ThemeChangeScreen.name,
      builder: (context, state) => const ThemeChangeScreen(),
    ),
    GoRoute(
      path: '/leter_num_screen',
      name: ConversionScreen.name,
      builder: (context, state) => const ConversionScreen(),
    ),
    GoRoute(
      path: '/page_view_screen',
      name: PageviewScreen.name,
      builder: (context, state) => const PageviewScreen(),
    ),
    GoRoute(
      path: '/video_view_screen',
      name: VideoPlayerScreen.name,
      builder: (context, state) => const VideoPlayerScreen(),
    ),
    GoRoute(
      path: '/page_porfolio_screen',
      name: PagePortfolioScreen.name,
      builder: (context, state) => const PagePortfolioScreen(),
    ),
    GoRoute(
      path: '/triqui_screen',
      name: TriquiScreen.name,
      builder: (context, state) => const TriquiScreen(),
    ),
  ],
);
