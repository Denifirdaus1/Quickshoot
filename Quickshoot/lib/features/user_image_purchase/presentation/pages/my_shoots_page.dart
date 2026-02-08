import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyShootsPage extends StatefulWidget {
  const MyShootsPage({super.key});

  @override
  State<MyShootsPage> createState() => _MyShootsPageState();
}

class _MyShootsPageState extends State<MyShootsPage> {
  bool _onlyLockedFiles = false;

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
              'My shoots',
              style: TextStyle(
                color: Color(0xFFFDFDFD),
                fontSize: 16,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                height: 1.40,
                letterSpacing: -0.32,
              ),
            ),
            // Dummy spacer for symmetry or "Your coins" placeholder as seen in Figma
            const SizedBox(width: 32),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Albums Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '12 Albums',
                    style: TextStyle(
                      color: Color(0xFFE8E5E5),
                      fontSize: 14,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.28,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'only locked files',
                        style: TextStyle(
                          color: Color(0xFFACA9A9),
                          fontSize: 12,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.24,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Switch(
                        value: _onlyLockedFiles,
                        onChanged: (val) =>
                            setState(() => _onlyLockedFiles = val),
                        activeThumbColor: const Color(0xFFFB84A3),
                        inactiveThumbColor: const Color(0xFF666666),
                        inactiveTrackColor: const Color(0xFF333333),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Albums Horizontal List
              SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8.4),
                  itemBuilder: (context, index) {
                    final isFirst = index == 0;
                    final isFourth = index == 3;
                    return Container(
                      width: 56,
                      height: 70,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: isFirst
                                ? const Color(0xFFFB84A3)
                                : (isFourth
                                      ? Colors.white
                                      : const Color(0xFFBFBFBF)),
                            width: isFirst ? 1.6 : 0.5,
                          ),
                        ),
                        shadows: isFirst
                            ? [
                                const BoxShadow(
                                  color: Color(0xFFFB84A3),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                              ]
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/img/galery${(index % 4) + 1}.jpg',
                              fit: BoxFit.cover,
                              opacity: isFirst || isFourth
                                  ? null
                                  : const AlwaysStoppedAnimation(0.25),
                            ),
                            if (isFirst)
                              Container(
                                color: Colors.black.withValues(alpha: 0.4),
                                child: const Center(
                                  child: Text(
                                    'new',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Shoot Info Row
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF73A1D9),
                        width: 1.8,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(1.5),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jul 27, 2025',
                        style: TextStyle(
                          color: Color(0xFFE8E5E5),
                          fontSize: 12,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                      Text(
                        'shoot id: sht2548643',
                        style: TextStyle(
                          color: Color(0xFFACA9A9),
                          fontSize: 12,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Image Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 166 / 207.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final isVideo = index == 0;
                  final isLocked =
                      index == 1 || index == 2 || index == 4 || index == 5;

                  // Mock logic: Index 4 is locked but has NO price -> UnlockedFilePage
                  // Others locked have price -> LockedFilePage
                  final hasPrice = index != 4;

                  return GestureDetector(
                    onTap: () {
                      if (isLocked) {
                        if (hasPrice) {
                          context.pushNamed('locked_file');
                        } else {
                          context.pushNamed('unlocked_file');
                        }
                      }
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Color(0xFF1E1E1E),
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/img/galery${(index % 4) + 1}.jpg',
                              fit: BoxFit.cover,
                            ),
                            if (isVideo)
                              const Positioned(
                                bottom: 6.5,
                                right: 2,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            if (isLocked)
                              Container(
                                color: Colors.black.withValues(alpha: 0.15),
                                child: Center(
                                  child: hasPrice
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withValues(
                                                  alpha: 0.2,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.lock,
                                                color: Colors.white,
                                                size: 21,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 9,
                                                    vertical: 3,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withValues(
                                                  alpha: 0.2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                              ),
                                              child: const Text(
                                                '€7.90',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'SF Pro',
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(), // No price, show nothing or maybe open lock? User implied it's "unlocked file" page but "click album yang gaada harganya".
                                  // If there is NO PRICE, it means it's likely already paid or free, thus "unlocked".
                                  // For visual clarity, I will NOT show the lock icon if there is no price, OR show an open lock?
                                  // The user said "album yang gaada harganya". Usually locked implies price.
                                  // If it's "unlocked file", maybe it shouldn't have the dark overlay?
                                  // BUT, the user said "click album that has no price".
                                  // If I remove the overlay, it looks like a normal image.
                                  // Let's keep the logic simple: Logic says if (isLocked), show overlay.
                                  // If (!hasPrice), maybe just show empty center or different icon.
                                  // I'll leave the overlay for now so it's clickable as a "special" item.
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
