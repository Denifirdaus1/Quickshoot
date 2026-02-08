import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF101010), // var(--black-100)
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Image
              Stack(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFB84A3),
                        width: 2.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png', // Placeholder
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  // Online Indicator Badge
                  Positioned(
                    right: 0,
                    top: 4,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50), // Green online color
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Name
              const Text(
                'Josephine',
                style: TextStyle(
                  color: Color(0xFFF5F5F5),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32,
                  fontFamily: 'SF Pro', // Assuming SF Pro is available or will use default
                ),
              ),
              // Verified Badge
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icon/Frame 1000005583.png',
                    width: 11,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'verified',
                    style: TextStyle(
                      color: Color(0xFFE8E5E5),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.24,
                      fontFamily: 'SF Pro',
                    ),
                  ),
                ],
              ),
            ],
          ),
          // More options button on the right
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.more_vert,
                color: Color(0xFFACA9A9),
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}