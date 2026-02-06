import 'package:flutter/material.dart';

class OfferPopup extends StatelessWidget {
  final VoidCallback onClose;

  const OfferPopup({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFACA9A9),
                  borderRadius: BorderRadius.circular(91.6),
                ),
              ),
              const SizedBox(height: 11),
              
              // Image
              Image.network(
                'https://www.figma.com/api/mcp/asset/7178a121-f847-4b5f-972d-b900ae1c0b75',
                height: 150,
                width: 170,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.card_giftcard, size: 100, color: Colors.pink),
              ),
              
              const SizedBox(height: 11),
              
              // Text content
              const Text(
                'Limited offer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro',
                  letterSpacing: -0.4,
                ),
              ),
              
              const SizedBox(height: 4),
              
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: 'SF Pro',
                  ),
                  children: [
                    TextSpan(
                      text: '\$0',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.28,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 4),
              
              const Text(
                '\$0 Shooting fee on Every shoot',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                  letterSpacing: -0.28,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // CTA Button
              GestureDetector(
                onTap: onClose,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF666666)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Grab now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFDFDFD),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro',
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Close Button
          Positioned(
            right: 0,
            top: 9,
            child: GestureDetector(
              onTap: onClose,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: Image.network(
                    'https://www.figma.com/api/mcp/asset/3676378a-3a5e-447d-b103-b6ddae39f2be',
                    width: 24,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.close, color: Color(0xFF333333)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
