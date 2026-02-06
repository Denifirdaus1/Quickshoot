import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 9.3, // 11.6 * 0.8
            horizontal: 8, // Keep at 8
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Search Bar
              Expanded(
                child: Container(
                  height: 51.0, // 63.8 * 0.8
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                  ), // 17.4 * 0.8
                  decoration: ShapeDecoration(
                    color: const Color(0xFF101010),
                    /* Black-100 */
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFF333333) /* Black-50 */,
                      ),
                      borderRadius: BorderRadius.circular(70), // 87 * 0.8
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x99000000),
                        blurRadius: 14.0, // 17.4 * 0.8
                        offset: Offset(0, 4.6), // 5.8 * 0.8
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/Vector1.png', // Search Icon
                        width: 23.2,
                        height: 23.2,
                        color: const Color(0xFF666666),
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ), // 11.6 * 0.8 -> Reduced further to 8? Or just scale? 11.6 * 0.8 = 9.28. Let's keep it tight as requested. 8.0 is good.
                      Expanded(
                        child: Text(
                          'City, Photographer, or Category',
                          style: TextStyle(
                            color: const Color(0xFF666666),
                            /* Black-25 */
                            fontSize: 14.0, // 17.5 * 0.8
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                            letterSpacing: -0.24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                width: 6.0,
              ), // Reduced spacing from 11.6 to 6.0 to widen search bar
              // Icons Row
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Button 1 (Filter with Dot on Outline)
                  Stack(
                    // Wrapped Container in Stack to allow dot to sit on outline/border
                    children: [
                      Container(
                        width: 51.0,
                        height: 51.0,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF101010),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFF333333),
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x99000000),
                              blurRadius: 14.0,
                              offset: Offset(0, 4.6),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icon/hugeicons_filter-horizontal.png',
                            width: 23.2,
                            height: 23.2,
                            color: Colors.white,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Dot positioned on the outline
                      Positioned(
                        right: 0, // Align to right edge of container
                        top: 0, // Align to top edge of container
                        child: Container(
                          width: 10.5,
                          height: 10.5,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFB84A3),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF101010),
                              ),
                              borderRadius: BorderRadius.circular(21.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 6.0),
                  // Button 2 (Scanner)
                  Container(
                    width: 51.0, // 63.8 * 0.8
                    height: 51.0, // 63.8 * 0.8
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                    ), // 17.4 * 0.8
                    decoration: ShapeDecoration(
                      color: const Color(0xFF101010),
                      /* Black-100 */
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFF333333) /* Black-50 */,
                        ),
                        borderRadius: BorderRadius.circular(70), // 87 * 0.8
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x99000000),
                          blurRadius: 14.0, // 17.4 * 0.8
                          offset: Offset(0, 4.6), // 5.8 * 0.8
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icon/Vector.png',
                        width: 23.2,
                        height: 23.2,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
