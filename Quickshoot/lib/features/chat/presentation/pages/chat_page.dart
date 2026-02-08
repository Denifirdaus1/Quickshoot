import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshoot/features/home/presentation/widgets/report_sheet.dart';

class ChatPage extends StatelessWidget {
  final String userName;

  const ChatPage({super.key, this.userName = 'Emilia'});

  @override
  Widget build(BuildContext context) {
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
                      side: const BorderSide(
                        width: 0.50,
                        color: Color(0xFFE8E5E5),
                      ),
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
              const SizedBox(width: 12),
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
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF73A1D9),
                          ),
                          borderRadius: BorderRadius.circular(162.27),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(162.27),
                          child: Image.asset(
                            'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png', // Placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16.87,
                      top: 34.23,
                      child: Image.asset(
                        'assets/icon/Group 1000002849.png', // Or similar group icon
                        width: 14.63,
                        height: 13.17,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                            letterSpacing: -0.28,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const SizedBox(
                          width: 8.28,
                          height: 10.5,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  size: 10,
                                  color: Colors.blue,
                                ), // Placeholder for verified
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 12,
                          color: Color(0xFF333333),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          '70m',
                          style: TextStyle(
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
                ),
              ),
              // More options
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ReportSheet(),
                  );
                },
                child: const SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.more_vert, color: Color(0xFF333333)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Safety Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  border: Border.all(color: const Color(0xFFE8E5E5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/ShieldCheck.png',
                      width: 16,
                      height: 16,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.shield_outlined, size: 16),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Enjoy Safe Shoots',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  children: [
                    // System Message: Lets Shoot
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFACA9A9),
                                width: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: Color(0xFF333333),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Lets Shoot!',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          // User Avatar + Time
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '6:44pm',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.24,
                                ),
                              ),
                              const SizedBox(width: 8),
                              _buildAvatar(isMe: true),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Other User Message
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            _buildAvatar(isMe: false),
                            const SizedBox(height: 4),
                            const Text(
                              '6:44pm',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMessageBubble(
                              'I\'m Emilia, a photographer nearby,',
                              isMe: false,
                            ),
                            const SizedBox(height: 4),
                            _buildMessageBubble(
                              'We can keep it casual and fun.',
                              isMe: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // My Message + Map
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildMessageBubble(
                              'i can see you in the map on my way to you',
                              isMe: true,
                              isOutlined: true,
                            ),
                            const SizedBox(height: 8),
                            // Map Bubble
                            Container(
                              width: 212,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDFDFD),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFACA9A9),
                                  width: 0.1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Location',
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 14,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFE8E5E5),
                                      ),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://www.figma.com/api/mcp/asset/4903867e-fb5a-40e2-b567-3cfdccfc14cc',
                                        ), // Replace with asset or map widget
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withValues(
                                            alpha: 0.2,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            _buildAvatar(isMe: true),
                            const SizedBox(height: 4),
                            const Text(
                              '6:44pm',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Delivery Message
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            _buildAvatar(isMe: false),
                            const SizedBox(height: 4),
                            const Text(
                              '6:44pm',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 12,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 213,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Here is your Delivery!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.28,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Blurred Image Placeholder
                              Container(
                                height: 193,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://www.figma.com/api/mcp/asset/b772103f-0e1f-4f3f-9853-cdb2ec576450',
                                    ), // Replace with asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.4,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '32 Files',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Shoot ID : 192939839484',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFACA9A9),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100), // Space for bottom input
                  ],
                ),
              ),
            ],
          ),
          // Bottom Input Field
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 340,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write...',
                          hintStyle: TextStyle(
                            color: Color(0xFFACA9A9),
                            fontSize: 14,
                            fontFamily: 'SF Pro',
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF333333),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.image_outlined, color: Color(0xFF333333)),
                    const SizedBox(width: 8),
                    const Icon(Icons.send, color: Color(0xFF333333)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar({required bool isMe}) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isMe ? const Color(0xFFFB84A3) : const Color(0xFF73A1D9),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ClipOval(
          child: Image.asset(
            isMe
                ? 'assets/img/review1.png'
                : 'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(
    String message, {
    required bool isMe,
    bool isOutlined = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: 213),
      decoration: BoxDecoration(
        color:
            isOutlined
                ? Colors.transparent
                : const Color(0xFFF5F5F5), // Light grey background
        borderRadius: BorderRadius.circular(8),
        border: isOutlined
            ? Border.all(color: const Color(0xFFACA9A9), width: 0.1)
            : null,
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 14,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          letterSpacing: -0.28,
        ),
      ),
    );
  }
}
