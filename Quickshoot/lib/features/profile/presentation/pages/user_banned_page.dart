import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserBannedPage extends StatelessWidget {
  const UserBannedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration
                SizedBox(
                  width: 100,
                  height: 103,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circular Background
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Stop Hand Icon / Illustration
                      const Icon(
                        Icons.front_hand,
                        size: 48,
                        color: Color(0xFFED1F24),
                      ),
                      // Decorative Lines (Simplified)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(Icons.wb_sunny_outlined, size: 24, color: Colors.grey[300]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Text Content
                const Text(
                  'You are paused',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro',
                    letterSpacing: -0.48,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You have been banned by admin for misconduct on the platform. Contact Support for to resolve your issue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    height: 1.4,
                    letterSpacing: -0.32,
                  ),
                ),
                const SizedBox(height: 32),

                // Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.pushNamed('support_chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate back to login / splash
                      context.goNamed('splash');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE8E5E5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back to login',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF Pro',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
