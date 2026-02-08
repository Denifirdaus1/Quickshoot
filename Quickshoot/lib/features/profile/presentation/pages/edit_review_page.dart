import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditReviewPage extends StatelessWidget {
  const EditReviewPage({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const Text(
              'Inbox', // Based on Figma, though 'Edit Review' might be better
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // Profile Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF73A1D9), width: 2.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Emillia',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset('assets/icon/Frame 1000005583.png', width: 11, height: 14),
                          const SizedBox(width: 4),
                          const Text('verified', style: TextStyle(color: Color(0xFF333333), fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Text('4.7 (261)', style: TextStyle(color: Color(0xFF333333), fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Ratings
              _buildRatingRow('Friendliness'),
              _buildRatingRow('Punctuality'),
              _buildRatingRow('Creativity'),
              _buildRatingRow('Empathy'),
              const SizedBox(height: 24),
              // Review Text
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFACA9A9), width: 0.5)),
                ),
                child: const Text(
                  'During my recent trip to the picturesque town of Willow Creek, I had the incredible opportunity to collaborate with a talented photographer named Sarah. Her keen eye for detail and ability to capture the essence of the moment truly made our experience unforgettable.',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 14, height: 1.4),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    'Max 500 letters',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Image Upload Placeholder
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => _showImageOptions(context),
                  child: Container(
                    width: 108,
                    height: 135,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE8E5E5), width: 1.5),
                    ),
                    child: Stack(
                      children: [
                        // Placeholder image or icon
                        Center(
                          child: Icon(Icons.add_a_photo_outlined, color: Colors.grey[400], size: 32),
                        ),
                        // Trash Icon
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: () => _showDeleteConfirmation(context),
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(21),
                                border: Border.all(color: const Color(0xFF101010), width: 0.5),
                                boxShadow: const [
                                  BoxShadow(color: Color(0x1F000000), blurRadius: 1, offset: Offset(0, 1)),
                                ],
                              ),
                              child: const Icon(Icons.delete_outline, size: 14, color: Color(0xFF333333)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: const BorderSide(color: Color(0xFFE8E5E5)),
                      ),
                      child: const Text('Cancel', style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _showSuccessModal(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E1E1E),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Update', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'By submitting i allow, that my photo will be shown publicy on the app platform.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFACA9A9), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF333333), fontSize: 14)),
          Row(
            children: List.generate(5, (index) {
              return const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(Icons.star, color: Colors.amber, size: 20),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Remove photo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Do you want to remove this photo?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side: const BorderSide(color: Color(0xFFE8E5E5)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Perform delete action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Yes, remove', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    // Placeholder for image upload options (design 1366:9722 not fully clear on interaction, assume standard upload)
  }

  void _showSuccessModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF1E1E1E), size: 44),
            const SizedBox(height: 16),
            const Text(
              'Review Updated!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8),
            const Text(
              'thank you for letting us know about it',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
