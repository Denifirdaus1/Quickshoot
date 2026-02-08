import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set to true to show the empty state for first-time users
    final bool isEmpty = true; 

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFDFD),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFFE8E5E5)),
                      borderRadius: BorderRadius.circular(9.14),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 14,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  'Inbox',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                    letterSpacing: -0.32,
                  ),
                ),
              ),
              // Spacer for symmetry
              const SizedBox(width: 32),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: isEmpty 
          ? const _EmptyInbox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Chats',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 20,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      height: 1.40,
                      letterSpacing: -0.40,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: const [
                        _ChatCard(
                          name: 'Emilia',
                          message: 'I´d like to make some pics of you, interested?',
                          time: '1h',
                          distance: '70m',
                          isOnline: true,
                          isVerified: true,
                        ),
                        _ChatCard(
                          name: 'Ivan',
                          message: 'I´d like to make some pics of you, interested?',
                          time: '1h',
                          distance: '70m',
                          isOnline: false,
                          isVerified: false,
                        ),
                        _ChatCard(
                          name: 'Kimberly',
                          message: 'I´d like to make some pics of you, interested?',
                          time: '1h',
                          distance: '70m',
                          isOnline: true,
                          isVerified: false,
                        ),
                        _ChatCard(
                          name: 'Daniel',
                          message: 'I´d like to make some pics of you, interested?',
                          time: '1h',
                          distance: '70m',
                          isOnline: true,
                          isVerified: true,
                        ),
                        _ChatCard(
                          name: 'Sanders',
                          message: 'I´d like to make some pics of you, interested?',
                          time: '1h',
                          distance: '70m',
                          isOnline: true,
                          isVerified: true,
                        ),
                        _ChatCard(
                          name: 'Support',
                          message: 'Hello! how can i help you?',
                          time: '1h',
                          isOnline: false,
                          isVerified: false,
                          isSupport: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class _EmptyInbox extends StatelessWidget {
  const _EmptyInbox();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration
            Image.asset(
              'assets/img/empty inbox.png',
              width: 250,
              height: 180,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.chat_bubble_outline, size: 100, color: Color(0xFFACA9A9)),
            ),
            const SizedBox(height: 8),
            // Text Content
            const Text(
              'Your inbox is empty',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.32,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Grab a free shoot',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 12,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.24,
              ),
            ),
            const SizedBox(height: 16),
            // CTA Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.goNamed('home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E1E1E),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Find photographers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String? distance;
  final bool isOnline;
  final bool isVerified;
  final bool isSupport;

  const _ChatCard({
    required this.name,
    required this.message,
    required this.time,
    this.distance,
    required this.isOnline,
    required this.isVerified,
    this.isSupport = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSupport) {
          context.pushNamed('support_chat');
        } else {
          context.pushNamed('chat', pathParameters: {'id': name});
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xFFF5F5F5))),
        ),
        child: Row(
          children: [
            // Profile Image
            SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: isSupport
                              ? const Color(0xFFFB84A3)
                              : const Color(0xFF73A1D9),
                        ),
                        borderRadius: BorderRadius.circular(162.27),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(162.27),
                        child: isSupport
                            ? Image.asset(
                              'assets/img/test.png',
                              fit: BoxFit.cover,
                            ) // Support icon placeholder
                            : Image.asset(
                              'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                  ),
                  if (!isSupport)
                    Positioned(
                      top: 3.5,
                      right: 3.5,
                      child: Container(
                        width: 10.75,
                        height: 10.75,
                        decoration: ShapeDecoration(
                          color:
                              isOnline
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFACA9A9),
                          shape: const OvalBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    left: 16.87,
                    top: 34.23,
                    child: Image.asset(
                      'assets/icon/Group 1000002848.png',
                      width: 14.63,
                      height: 13.17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 14,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w500,
                              height: 1.40,
                              letterSpacing: -0.28,
                            ),
                          ),
                          if (isVerified) ...[
                            const SizedBox(width: 4),
                            Image.asset(
                              'assets/icon/Frame 1000005583.png',
                              width: 11,
                              height: 14,
                            ),
                          ] else if (!isSupport) ...[
                            const SizedBox(width: 4),
                            // Grey unverified badge if needed
                          ],
                          if (distance != null) ...[
                            const SizedBox(width: 6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: Color(0xFFACA9A9),
                                ),
                                Text(
                                  distance!,
                                  style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Color(0xFFACA9A9),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF353535),
                      fontSize: 12,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
