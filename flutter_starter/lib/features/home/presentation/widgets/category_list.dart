import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories from Figma snippet + "Portrait", "Fashion" from existing code
    final categories = [
      'Street Art',
      'Lifestyle',
      'Wedding',
      'Family',
      'Food', // Added from snippet
      'Portrait',
      'Fashion',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 9.3), // 8 * 1.16 scaled
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            final isFirst = index == 0;

            // Dimensions Scaled ~1.16x (similar to Search Section)
            // Height 36 -> 42.0
            // Padding H 15 -> 17.5
            // Font 12 -> 14.0

            return Padding(
              padding: EdgeInsets.only(right: 9.3), // Spacing 8 -> 9.3
              child: Container(
                height: 42.0,
                padding: const EdgeInsets.symmetric(horizontal: 17.5),
                decoration: ShapeDecoration(
                  color: isFirst
                      ? const Color(0xFF1E1E1E) /* Black-75 */
                      : const Color(0xFF101010),
                  /* Black-100 */
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: isFirst
                          ? const Color(0xFF666666) /* Black-25 */
                          : const Color(0xFF333333) /* Black-50 */,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: isFirst
                      ? const [
                          BoxShadow(
                            color: Color(0x99000000),
                            blurRadius: 14.0, // 12 * 1.16
                            offset: Offset(0, 4.6), // 4 * 1.16
                            spreadRadius: 0,
                          ),
                        ]
                      : [], // Only first item has shadow in snippet
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: Color(0xFFF5F5F5),
                        /* White-75 */
                        fontSize: 14.0,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight
                            .w500, // w510 in snippet -> w500/w600 in Flutter. Using w500.
                        height: 1.40,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
