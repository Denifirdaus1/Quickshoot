import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class MapPhotographerCard extends StatelessWidget {
  const MapPhotographerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF333333), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Section
          GestureDetector(
            onTap: () => context.pushNamed('photographer_profile'),
            child: Container(
              width: 120,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF73A1D9), width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.5),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/img/Component 715.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // "free pic" Badge
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: const Color(0xFF101010)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/icon/fluent_fire-16-filled.png',
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'free pic',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // "Available" Badge
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        // Ensure blur stays within bounds
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(6.5),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.5, sigmaY: 4.5),
                          child: Container(
                            height: 23,
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF333333,
                              ).withValues(alpha: 0.25),
                              border: const Border(
                                top: BorderSide(color: Color(0x1FE8E5E5)),
                              ), // White-50 with low opacity
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4CAF50),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  'Available',
                                  style: TextStyle(
                                    color: Color(0xFFF5F5F5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed('photographer_profile'),
                  child: Row(
                    children: [
                      const Text(
                        'Emillia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.32,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        'assets/icon/Frame 1000005583.png',
                        width: 10,
                        height: 13,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 11),
                    const Text(
                      ' 5.0 (261) ',
                      style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 12),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 11),
                    ),
                    const Expanded(
                      child: Text(
                        ' €8.90',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/tdesign_location-filled.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      '70m',
                      style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag('Street Art'),
                    const SizedBox(width: 4),
                    _buildTag('Lifestyle'),
                    const SizedBox(width: 4),
                    _buildTag('+3'),
                  ],
                ),
                const Spacer(),
                // Shoot CTA
                Container(
                  width: double.infinity,
                  height: 48, // Fixed height to match design
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
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
                        'assets/icon/Group.png',
                        width: 23,
                        height: 22,
                        color: const Color(0xFF333333),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Let's Shoot",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.32,
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
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 10,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}