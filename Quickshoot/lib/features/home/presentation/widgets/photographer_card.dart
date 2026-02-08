import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhotographerCard extends StatefulWidget {
  const PhotographerCard({super.key});

  @override
  State<PhotographerCard> createState() => _PhotographerCardState();
}

class _PhotographerCardState extends State<PhotographerCard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;

  // List of images - currently duplicates as requested ("gpp img nya sama juga")
  final List<String> _images = List.generate(
    5,
    (_) => 'assets/img/Component 715.png',
  );

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                _currentIndex = (_currentIndex + 1) % _images.length;
              });
              _controller.reset();
              _controller.forward();
            }
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicatorContent(int index) {
    if (index < _currentIndex) {
      return Container(color: const Color(0xFFFDFDFD));
    } else if (index == _currentIndex) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return LinearProgressIndicator(
            value: _controller.value,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFDFDFD)),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Design is based on the "Large" card variant
    // Width: 275, Height: 344
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 315,
          height: 354,
          clipBehavior: Clip.antiAlias, // Clip children to border radius
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: const Color(0xFF333333), width: 6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 11.34,
                offset: const Offset(0, 3.78),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background Image with Gradient Overlay
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26), // 32 - 6
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          _images[_currentIndex],
                          key: ValueKey<int>(_currentIndex),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(color: Colors.grey[800]);
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.4, 0.9],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Top Status Bars (Story Style)
              Positioned(
                top: 16,
                left: 16,
                right: 16, // Constrain width to respect right padding
                child: Row(
                  children: List.generate(_images.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == _images.length - 1 ? 0 : 5,
                        ),
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFF101010).withOpacity(0.23),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: _buildIndicatorContent(index),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Top Right "free pic" Badge
              Positioned(
                top: 24,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(56),
                    border: Border.all(
                      color: const Color(0xFF101010),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/fluent_fire-16-filled.png',
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'free pic',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDFDFD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Left "Available" Badge (Moved inside)
              Positioned(
                top: 150,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 10,
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF333333),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(56),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Available',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDFDFD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Content Area
              Positioned(
                bottom: 12,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile Row
                    GestureDetector(
                      onTap: () => context.pushNamed('photographer_profile'),
                      child: Row(
                        children: [
                          // Profile Image
                          Stack(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF73A1D9),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Online Dot (Top Right)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4CAF50),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(
                                        0xFF1E1E1E,
                                      ), // Match card bg for spacing effect
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              // Bottom Icon
                              Positioned(
                                bottom: -2,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Image.asset(
                                    'assets/icon/Group 1000002848.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          // Name & Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Emillia',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFDFDFD),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/icon/Frame 1000005583.png',
                                      width: 14,
                                      height: 14,
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/icon/tdesign_location-filled.png',
                                      width: 12,
                                      height: 12,
                                      color: const Color(0xFFF5F5F5),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '70m',
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      '5.0',
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      '(261)',
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        'Files from €8.90',
                                        style: TextStyle(
                                          color: Color(0xFFF5F5F5),
                                          fontSize: 11,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Tags
                    Row(
                      children: [
                        _buildTag('Street Art'),
                        const SizedBox(width: 6),
                        _buildTag('Lifestyle'),
                        const SizedBox(width: 6),
                        _buildTag('Wedding'),
                        const SizedBox(width: 6),
                        _buildTag('+2'),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // CTA Button
                    Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(113.375),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Color.fromARGB(255, 209, 182, 190),
                          ],
                          stops: [0.0, 0.85, 1.0],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(221, 221, 221, 0.30),
                            offset: Offset(1.89, 3.779),
                            blurRadius: 17.006,
                            spreadRadius: 9.448,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/mynaui_chat-dots.png',
                            width: 22,
                            height: 22,
                            color: const Color(0xFF333333),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Let\'s Shoot',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}