import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(color: Color(0xFF1E1E1E) /* Black-75 */),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 18,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 117.70,
                  height: 18,
                  child: Image.asset(
                    'assets/logo/Logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Chat
          GestureDetector(
            onTap: () => context.pushNamed('inbox'),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 44,
              height: 44,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 26,
                      height: 26,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/icon/mynaui_chat-dots.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.chat_bubble_outline_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 26,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFB84A3),
                        /* Primary-Pink */
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFF1E1E1E) /* Black-75 */,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),
                  // Text
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'Chat',
                      style: TextStyle(
                        color: Color(0xFFACA9A9),
                        /* White-25 */
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          // My Shoots
          GestureDetector(
            onTap: () => context.pushNamed('my_shoots'),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Icon Container
                  Container(
                    width: 58,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 26,
                      height: 26,
                      child: Center(
                        child: Image.asset(
                          'assets/icon/Group.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.photo_library_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 33.50,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFB84A3),
                        /* Primary-Pink */
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFF1E1E1E) /* Black-75 */,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),

                  // Text
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'My Shoots',
                      style: TextStyle(
                        color: Color(0xFFACA9A9),
                        /* White-25 */
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Profile
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 44,
              height: 44,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 26,
                      height: 26,
                      child: Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/img/Frame 1000006417.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.55,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFFB84A3) /* Primary-Pink */,
                              ),
                              borderRadius: BorderRadius.circular(55.54),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1.09,
                                offset: Offset(0, 1.09),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Text
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xFFACA9A9),
                        /* White-25 */
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
