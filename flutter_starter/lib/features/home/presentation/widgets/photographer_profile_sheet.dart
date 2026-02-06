import 'package:flutter/material.dart';
import 'map_photographer_card.dart';
import 'report_sheet.dart';

class PhotographerProfileSheet extends StatefulWidget {
  final ScrollController? controller;
  final ScrollPhysics? physics;

  const PhotographerProfileSheet({super.key, this.controller, this.physics});

  @override
  State<PhotographerProfileSheet> createState() =>
      _PhotographerProfileSheetState();
}

class _PhotographerProfileSheetState extends State<PhotographerProfileSheet> {
  final _overlayController = OverlayPortalController();
  final _linkLayer = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. Main Content Card
        Container(
          margin: const EdgeInsets.only(top: 31),
          decoration: const BoxDecoration(
            color: Color(0xFF101010),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // --- FIXED HEADER ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 11),
                  // Handle bar
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Space for avatar overlap

                  // 1. Stats / Info Pills (SWAPPED TO TOP)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: CompositedTransformTarget(
                            link: _linkLayer,
                            child: OverlayPortal(
                              controller: _overlayController,
                              overlayChildBuilder: (context) {
                                return CompositedTransformFollower(
                                  link: _linkLayer,
                                  showWhenUnlinked: false,
                                  offset: const Offset(0, 36),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: _buildPricingDropdown(),
                                  ),
                                );
                              },
                              child: GestureDetector(
                                onTap: () => _overlayController.toggle(),
                                child: _buildInfoPill('Files from € 8.90', center: true),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildInfoPill('★ 4.7 (261)', icon: Icons.star),
                        const SizedBox(width: 8),
                        _buildActionIcon(Icons.more_vert),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // 2. Top Info Section (SWAPPED TO BOTTOM)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Emillia',
                              style: TextStyle(
                                color: Color(0xFFF5F5F5),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro',
                                letterSpacing: -0.32,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              'assets/icon/Frame 1000005583.png',
                              width: 13,
                              height: 13,
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/ShieldCheck.png',
                                    width: 10,
                                    height: 13,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'verified',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          "Aperture Ace. Capturing life, one frame at a time. Let's create visual stories together!",
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 11,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),

              // --- SCROLLABLE CONTENT ---
              Expanded(
                child: SingleChildScrollView(
                  controller: widget.controller,
                  physics: widget.physics,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 7,
                          runSpacing: 7,
                          children: [
                            _buildTag('Street Art'),
                            _buildTag('Lifestyle'),
                            _buildTag('Fashion Trends'),
                            _buildTag('+3'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              childAspectRatio: 166 / 208,
                            ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.6),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/galery${index + 1}.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 22),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      SizedBox(
                        height: 430,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 11),
                          itemBuilder: (context, index) {
                            final imagePath = index == 0
                                ? 'assets/img/review1.png'
                                : 'assets/img/review2.jpg';
                            return ReviewCard(imagePath: imagePath);
                          },
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'More photographer nearby',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      SizedBox(
                        height: 175,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 9),
                          itemBuilder: (context, index) =>
                              const MapPhotographerCard(),
                        ),
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 2. Centered Overlapping Avatar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 63,
                  height: 63,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF73A1D9),
                      width: 2.5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF101010),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/icon/Group 1000002848.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 3. Floating 'free pic' Badge
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: const Color(0xFF101010)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icon/fluent_fire-16-filled.png',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                const Text(
                  'free pic',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro',
                  ),
                ),
              ],
            ),
          ),
        ),

        // 4. Floating GPS Button
        Positioned(
          top: -15,
          right: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE8E5E5), width: 0.9),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF252525).withValues(alpha: 0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.my_location, size: 20, color: Color(0xFF333333)),
          ),
        ),

        // 5. Bottom CTA
        Positioned(
          bottom: 18,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 44,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(113.375),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Color.fromARGB(255, 209, 182, 190),
                  ],
                  stops: [0.0, 0.85, 1.0],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(221, 221, 221, 0.30),
                    offset: Offset(1.89, 3.779),
                    blurRadius: 17.006,
                    spreadRadius: 9.448,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon/mynaui_chat-dots.png',
                    width: 20,
                    height: 20,
                    color: const Color(0xFF333333),
                  ),
                  const SizedBox(width: 11),
                  const Text(
                    "Let's Shoot",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPricingDropdown() {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33666666),
              blurRadius: 32,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDropdownRow(Icons.photo_outlined, 'Photos:', '€7.90'),
                  const SizedBox(height: 10),
                  _buildDropdownRow(
                    Icons.videocam_outlined,
                    'Videos:',
                    '€20.90 - €40.90',
                  ),
                  const SizedBox(height: 10),
                  _buildDropdownRow(
                    Icons.star_outline,
                    '1 free Pic for a review',
                    '',
                    showHelp: true,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Change pricing for your next shoot in your Profile.',
                      style: TextStyle(
                        color: Color(0xFFE8E5E5),
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: GestureDetector(
                onTap: () => _overlayController.hide(),
                child: const Icon(Icons.close, size: 20, color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownRow(
    IconData icon,
    String label,
    String price, {
    bool showHelp = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFF5F5F5)),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontFamily: 'SF Pro',
          ),
        ),
        if (price.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'SF Pro',
            ),
          ),
        ],
        if (showHelp) ...[
          const Spacer(),
          const Icon(Icons.help_outline, size: 16, color: Color(0xFFF5F5F5)),
        ],
      ],
    );
  }

  Widget _buildInfoPill(String text, {IconData? icon, bool center = false}) {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: center ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: center ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: Colors.amber),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: const TextStyle(color: Color(0xFFF5F5F5), fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const ReportSheet(),
        );
      },
      child: Container(
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 16,
          color: Colors.white.withValues(alpha: 0.75),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String imagePath;
  const ReviewCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF333333), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFB84A3),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emma',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'recently',
                      style: TextStyle(color: Colors.white24, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white54, size: 18),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Icon(Icons.star, color: Colors.amber, size: 16),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'I recently had the pleasure of working with a fantastic photographer... see more...',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
