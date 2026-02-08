import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnlockSequenceSheet extends StatefulWidget {
  const UnlockSequenceSheet({super.key});

  @override
  State<UnlockSequenceSheet> createState() => _UnlockSequenceSheetState();
}

class _UnlockSequenceSheetState extends State<UnlockSequenceSheet> {
  int _currentStep = 0; // 0: Offer, 1: Claimed, 2: Review, 3: Success

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F252525),
            blurRadius: 5,
            offset: Offset(0, -6),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildStepContent(),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildOfferStep();
      case 1:
        return _buildClaimedStep();
      case 2:
        return _buildReviewStep();
      case 3:
        return _buildSuccessStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildOfferStep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        key: const ValueKey(0),
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
          const SizedBox(height: 16),
          // Badge Icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFFB84A3),
                  const Color(
                    0xFFFB84A3,
                  ).withValues(alpha: 0.0), // Fade to transparent
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xA5FB84A3).withValues(alpha: 0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            padding: const EdgeInsets.all(5.28), // Simulate border width
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                /* Black-75 */
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  '1 Free\nunlock',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Continue with this file?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro',
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Leave a review to get this file for free',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontFamily: 'SF Pro',
              letterSpacing: -0.32,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE8E5E5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E1E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClaimedStep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        key: const ValueKey(1),
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 44),
          const SizedBox(height: 16),
          const Text(
            'Claimed Successfully!',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'You have successfully claimed your free unlock.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Write review', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewStep() {
    return SingleChildScrollView(
      key: const ValueKey(2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
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
            const SizedBox(height: 16),
            const Text(
              'Get a free file!',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.4,
              ),
            ),
            const Text(
              'leave a review in the app',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                letterSpacing: -0.28,
              ),
            ),
            const SizedBox(height: 16),
            // Photographer Info
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF73A1D9),
                      width: 2.5,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
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
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          'assets/icon/Frame 1000005583.png',
                          width: 11,
                          height: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'verified',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6.5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 4),
                          Text(
                            '4.7 (261)',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Ratings
            _buildRatingRow('Friendliness'),
            _buildRatingRow('Punctuality'),
            _buildRatingRow('Creativity'),
            _buildRatingRow('Empathy'),
            const SizedBox(height: 12),
            // Review Input
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFACA9A9), width: 0.5),
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'let others know more about your experience',
                  hintStyle: TextStyle(color: Color(0xFFACA9A9), fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  '*Please write a review\nMax 500 letters',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Color(0xFFE8E5E5)),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'By submitting i allow, that my photo will be shown publicy on photographers profile.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF666666), fontSize: 12),
            ),
          ],
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
          Text(
            label,
            style: const TextStyle(color: Color(0xFF333333), fontSize: 14),
          ),
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

  Widget _buildSuccessStep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        key: const ValueKey(3),
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 44),
          const SizedBox(height: 16),
          const Text(
            'Thank You!',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Your file is now unlocked and available in your gallery.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close sheet
                context.pushReplacementNamed('unlocked_file'); // Navigate to unlocked page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
