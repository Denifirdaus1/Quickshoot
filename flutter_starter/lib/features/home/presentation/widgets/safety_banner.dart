import 'package:flutter/material.dart';

class SafetyBanner extends StatelessWidget {
  const SafetyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Use full width or fixed 360 as per design? Snippet said width: 360.
      // Ideally in a responsive app we use double.infinity or constraint.
      // I'll stick to double.infinity but wrap content in Center/Row as provided.
      // User snippet: Container(width: 360, ... child: Row ...)
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        /* Black-75 */
        border: Border(
          top: BorderSide(width: 1, color: Color(0xFF333333)),
          /* Black-50 */
          bottom: BorderSide(width: 1, color: Color(0xFF333333)) /* Black-50 */,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 19.2, // 16 * 1.2
            height: 19.2, // 16 * 1.2
            padding: const EdgeInsets.symmetric(horizontal: 0),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/ShieldCheck.png',
                  width: 19.2,
                  height: 19.2,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.verified_user_outlined,
                    color: Color(0xFFF5F5F5),
                    size: 17, // Scaled fallback
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4), // Scaled spacing (3 * 1.2 = 3.6 -> 4)
          const Text(
            'safe shoots worldwide',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              /* White-75 */
              fontSize: 14.4, // 12 * 1.2
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w400,
              height: 1.40,
              letterSpacing: -0.24,
            ),
          ),
        ],
      ),
    );
  }
}
