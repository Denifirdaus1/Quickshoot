import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshoot/features/home/presentation/widgets/review_card.dart';
import '../widgets/my_review_options_sheet.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101010),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => context.pop(),
              borderRadius: BorderRadius.circular(9.143),
              child: Container(
                width: 32,
                height: 32,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              'My profile',
              style: TextStyle(
                color: Color(0xFFFDFDFD),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro',
              ),
            ),
            const SizedBox(width: 32), // Balance
          ],
        ),
      ),
      body: Column(
        children: [
          // User Info Section
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF101010),
            child: Row(
              children: [
                // Profile Pic
                Stack(
                  children: [
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFB84A3),
                          width: 2.75,
                        ),
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
                    Positioned(
                      top: 4,
                      right: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF101010), width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Name & Share
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Josephine',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/icon/Frame 1000005583.png',
                            width: 14,
                            height: 14,
                            color: const Color(0xFFFB84A3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          color: Color(0xFFFB84A3),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // Edit Button
                GestureDetector(
                  onTap: () => context.pushNamed('edit_profile'),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF333333), width: 0.5),
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Verification Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              border: Border(
                top: BorderSide(color: Color(0xFFE8E5E5)),
                bottom: BorderSide(color: Color(0xFFE8E5E5)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/Frame 1000005583.png',
                  width: 11,
                  height: 14,
                  color: const Color(0xFFFB84A3),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Get verified',
                  style: TextStyle(
                    color: Color(0xFFFB84A3),
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    fontFamily: 'SF Pro',
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              children: [
                const Text(
                  'Your given reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Outfit',
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 450, // Adjusted height for review cards
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return ReviewCard(
                        username: 'Emma',
                        onMoreTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const MyReviewOptionsSheet(
                              username: 'Emma',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
