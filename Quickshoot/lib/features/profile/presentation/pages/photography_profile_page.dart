import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshoot/features/home/presentation/widgets/review_card.dart';

class PhotographyProfilePage extends StatelessWidget {
  const PhotographyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header + Profile Section Container with Curved Bottom
            ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF222222), // Lighter background for contrast
                ),
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.network(
                        'https://www.figma.com/api/mcp/asset/965c80ce-2b41-4d49-82bd-288f7485e1fe',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2A2A2A),
                                Color(0xFF222222),
                              ], // Lighter end color for curve visibility
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Gradient Overlay for readability if needed
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.3),
                              Colors
                                  .transparent, // Don't darken the bottom too much so the curve shape is visible against the black body
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Content
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 40.0,
                        ), // Padding for the curve area
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Header Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (context.canPop()) {
                                        context.pop();
                                      } else {
                                        context.go('/home');
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(9.143),
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFF1E1E1E),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            9,
                                          ),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Photographer Profile',
                                    style: TextStyle(
                                      color: Color(0xFFFDFDFD),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF Pro',
                                    ),
                                  ),
                                  const SizedBox(width: 32), // Balance
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Profile Info (Inline from ProfileSection)
                            SizedBox(
                              width: 340,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    children: [
                                      // Profile Image with ring
                                      Stack(
                                        children: [
                                          Container(
                                            width:
                                                80, // Slightly larger perhaps? Original was 60
                                            height: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xFFFB84A3),
                                                width: 3,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                3.0,
                                              ),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => Container(
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Online Indicator
                                          Positioned(
                                            right: 4,
                                            top: 4,
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF4CAF50),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFF101010,
                                                  ), // Match background? Or white?
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      // Name
                                      const Text(
                                        'Josephine',
                                        style: TextStyle(
                                          color: Color(0xFFF5F5F5),
                                          fontSize: 20, // Larger
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'SF Pro',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // Verified
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icon/Frame 1000005583.png',
                                            width: 14,
                                            height: 14,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(
                                                      Icons.check_circle,
                                                      size: 14,
                                                      color: Colors.blue,
                                                    ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'verified',
                                            style: TextStyle(
                                              color: Color(0xFFE8E5E5),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'SF Pro',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // More option button - absolute in relation to valid context?
                                  // If inside this stack, it needs width context.
                                  // The user didn't specify position, but original had it top right.
                                  // Let's simplify and maybe put it in the header row if needed,
                                  // or float it relative to profile if design requires.
                                  // For now, the profile stack is centered.
                                  // If more button was part of the profile card, maybe it belongs here.
                                  // Let's add it absolutely positioned relative to this stack if we want to keep it close.
                                  // More option button
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Specific "More" button placed absolutely if needed relative to the container
                  ],
                ),
              ),
            ),

            // Reviews Section
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 380,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return const ReviewCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20); // Less curve
    var firstControlPoint = Offset(size.width / 2, size.height + 20);
    var firstEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
