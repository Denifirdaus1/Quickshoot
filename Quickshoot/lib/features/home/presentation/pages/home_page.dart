import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/home_header.dart';
import '../widgets/safety_banner.dart';
import '../widgets/search_section.dart';
import '../widgets/category_list.dart';
import '../widgets/photographer_card.dart';
import '../widgets/offer_popup.dart';
import '../widgets/sidebar/user_menu_sheet.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PageController _pageController;
  int _currentPage = 1; // Start at index 1 to show the middle card initially
  static bool _offerShownInSession = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.72, // Balanced peeking effect
      initialPage: _currentPage,
    );

    if (!_offerShownInSession) {
      _startOfferTimer();
    }
  }

  void _startOfferTimer() {
    Future.delayed(5.seconds, () {
      if (mounted) {
        _offerShownInSession = true;
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withValues(alpha: 0.5),
          builder: (context) => OfferPopup(
            onClose: () => Navigator.pop(context),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Updated dark background
      drawer: const UserMenuSheet(),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const HomeHeader(),

                // Safety Banner
                const SafetyBanner(),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),

                        // Search Section
                        const SearchSection(),

                        const SizedBox(height: 24),

                        // "Photography near you" Title
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              'Photography near you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Category List
                        const CategoryList(),

                        const SizedBox(height: 0),

                        // 3D Carousel
                        SizedBox(
                          height:
                              400, // Adjusted height for the cards + shadows
                          child: PageView.builder(
                            controller: _pageController,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: 5, // Dummy count
                            itemBuilder: (context, index) {
                              return AnimatedBuilder(
                                animation: _pageController,
                                builder: (context, child) {
                                  double page = 0.0;
                                  if (_pageController.position.haveDimensions) {
                                    page = _pageController.page!;
                                  } else {
                                    // Fallback for initial render
                                    page = _currentPage.toDouble();
                                  }

                                  // Calculate difference from center
                                  double diff = index - page;

                                  // Transform Calculation
                                  // 1. Scale: Center 1.0, Sides scaled down to 0.8
                                  double scale =
                                      1.0 -
                                      (diff.abs() * 0.20).clamp(0.0, 0.20);

                                  // 2. Rotation:
                                  // Factor: 0.045 radians (~2.5 degrees)
                                  double rotation = diff * 0.045;

                                  // 3. Translation: Center card slightly higher
                                  double translateY =
                                      diff.abs() *
                                      8.0; // Adjusted for balanced depth

                                  return Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001) // Perspective
                                      ..translateByDouble(
                                        0.0,
                                        translateY,
                                        0.0,
                                        1.0,
                                      )
                                      ..scaleByDouble(scale, scale, 1.0, 1.0)
                                      ..rotateZ(rotation),
                                    alignment: Alignment.center,
                                    child: child,
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: PhotographerCard(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Spacer for scrolling past FAB
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Floating "Open map" Button
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: FilledButton.icon(
                    onPressed: () => context.pushNamed('map_of_photography'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[900], // Dark button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100, // Increased width
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.grey[800]!),
                      ),
                    ),
                    icon: Image.asset(
                      'assets/icon/uiw_map.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Open map',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}