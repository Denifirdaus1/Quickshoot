import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportChatPage extends StatelessWidget {
  const SupportChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFDFD),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => context.pop(),
              borderRadius: BorderRadius.circular(9),
              child: Container(
                width: 32,
                height: 32,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                    side: const BorderSide(color: Color(0xFFE8E5E5), width: 0.5),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Support',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const SizedBox(height: 10),
              // User message
              _buildMessageRow(
                message: 'Hey i need help!',
                time: '6:44pm',
                isMe: true,
              ),
              const SizedBox(height: 16),
              // Support message
              _buildMessageRow(
                message: "Hello! If you need assistance, feel free to reach out. I'm here to help!",
                time: '6:44pm',
                isMe: false,
              ),
              const SizedBox(height: 16),
              // User message
              _buildMessageRow(
                message: "I'm having trouble with the app; all my photos in the album seem to be gone.",
                time: '6:44pm',
                isMe: true,
              ),
              const SizedBox(height: 100), // Space for input
            ],
          ),
          // Bottom input
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
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
                          hintStyle: TextStyle(color: Color(0xFFACA9A9), fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.image_outlined, color: Color(0xFF333333), size: 24),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send, color: Color(0xFF333333), size: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageRow({required String message, required String time, required bool isMe}) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMe) ...[
          _buildAvatar(isMe: false),
          const SizedBox(width: 8),
        ],
        Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(maxWidth: 213),
              decoration: BoxDecoration(
                color: isMe ? Colors.transparent : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: isMe ? Border.all(color: const Color(0xFFACA9A9), width: 0.1) : null,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Color(0xFF333333), fontSize: 14),
              ),
            ),
            if (isMe) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(time, style: const TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  const SizedBox(width: 8),
                  _buildAvatar(isMe: true),
                ],
              ),
            ] else ...[
              const SizedBox(height: 4),
              Text(time, style: const TextStyle(color: Color(0xFF666666), fontSize: 12)),
            ],
          ],
        ),
      ],
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
            isMe ? 'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png' : 'assets/img/test.png', // Placeholder support icon
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
