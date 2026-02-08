import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import '../widgets/file_report_sheet.dart';

class UnlockedFilePage extends StatefulWidget {
  const UnlockedFilePage({super.key});

  @override
  State<UnlockedFilePage> createState() => _UnlockedFilePageState();
}

class _UnlockedFilePageState extends State<UnlockedFilePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _dummyImages = [
    'assets/img/galery1.jpg',
    'assets/img/galery2.jpg', // Assuming valid assets or placeholders
    'assets/img/galery3.jpg',
    'assets/img/galery4.jpg',
    'assets/img/galery1.jpg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Vertical Pager (Background Image + Info)
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _dummyImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      // Fallback to galery1.jpg if index out of bounds or just cycle
                      index < _dummyImages.length
                          ? _dummyImages[index]
                          : 'assets/img/galery1.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/img/galery1.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),

                  // User Info (Top Left)
                  Positioned(
                    top: 90, // Moved down to clear header (44 + spacing)
                    left: 12,
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF73A1D9),
                              width: 1.3,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: ClipOval(
                              child: Image(
                                image: AssetImage(
                                  'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Jul 27, 2025',
                          style: TextStyle(
                            color: Color(0xFFE8E5E5),
                            fontSize: 12,
                            fontFamily: 'SF Pro',
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // 4. Header Actions (Back & More) - Fixed
          Positioned(
            top: 44, // Moved down +30px total
            left: 12,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(32),
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFFFFFFF).withValues(alpha: 0.2),
                              const Color(0xFFFFFFFF).withValues(alpha: 0.05),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
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
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const FileReportSheet(),
                    );
                  },
                  borderRadius: BorderRadius.circular(32),
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFFFFFFF).withValues(alpha: 0.2),
                              const Color(0xFFFFFFFF).withValues(alpha: 0.05),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 5. Vertical Indicators (Right Side) - Dynamic
          Positioned(
            right: 12,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_dummyImages.length, (index) {
                  double size = 8.1;
                  bool isPulse = false;
                  Color? color;

                  int distance = (index - _currentPage).abs();

                  if (distance == 0) {
                    size = 13.9;
                    isPulse = true;
                    color = const Color(0xFFFB84A3);
                  } else if (distance == 1) {
                    size = 11.6;
                  } else {
                    size = 8.1;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: _buildDot(size, color: color, isPulse: isPulse),
                  );
                }),
              ),
            ),
          ),

          // 6. Bottom Action Bar - Fixed
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Download
                GestureDetector(
                  onTap: () {
                    // Simulate download
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Downloading file...'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // In a real app, use image_gallery_saver or similar
                  },
                  child: _buildGlassAction(icon: Icons.download, size: 66),
                ),
                const SizedBox(width: 40),
                // Share
                GestureDetector(
                  onTap: () {
                    // Simulate share
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sharing file...'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // In a real app, use share_plus
                  },
                  child: _buildGlassAction(icon: Icons.share, size: 66),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(double size, {Color? color, bool isPulse = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFACA9A9).withValues(alpha: 0.5),
        shape: BoxShape.circle,
        boxShadow: isPulse
            ? [
                BoxShadow(
                  color: const Color(0xFFFB84A3).withValues(alpha: 0.2),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildGlassAction({
    IconData? icon,
    String? label,
    required double size,
    bool isPrice = false,
  }) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFFFFFFF).withValues(alpha: 0.2),
                const Color(0xFFFFFFFF).withValues(alpha: 0.05),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: icon != null
                ? Icon(icon, color: Colors.white, size: 28)
                : Text(
                    label!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isPrice ? 18.5 : 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Outfit',
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
