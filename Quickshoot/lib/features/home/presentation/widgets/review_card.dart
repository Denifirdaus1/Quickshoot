import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewCard extends StatelessWidget {
  final String username;
  final String? imagePath;
  final VoidCallback? onMoreTap;

  const ReviewCard({
    super.key,
    this.username = 'Emma',
    this.imagePath,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // var(--black-75)
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF333333), // var(--black-50)
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              // Profile Image with pink border
              GestureDetector(
                onTap: () => context.pushNamed('photographer_profile'),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFFB84A3), // Pink border
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        // Online indicator or badge
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8.5,
                            height: 8.5,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CAF50),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    // Name and Time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                color: Color(0xFFFDFDFD),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.28,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Image.asset(
                              'assets/icon/Frame 1000005583.png',
                              width: 11,
                              height: 14,
                            ),
                          ],
                        ),
                        const Text(
                          'recently',
                          style: TextStyle(
                            color: Color(0xFFACA9A9),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // More options
              GestureDetector(
                onTap: onMoreTap,
                child: const Icon(
                  Icons.more_vert,
                  color: Color(0xFFACA9A9),
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Star Rating
          Row(
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
              );
            }),
          ),
          const SizedBox(height: 6),
          // Review Text
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Color(0xFFFDFDFD),
                fontSize: 12,
                height: 1.4,
                letterSpacing: -0.24,
              ),
              children: [
                TextSpan(
                  text:
                      'I recently had the pleasure of working with a fantastic photographer during my visit ',
                ),
                TextSpan(
                  text: 'see more...',
                  style: TextStyle(color: Color(0xFFFB84A3)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Review Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath ?? 'assets/img/galery1.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
