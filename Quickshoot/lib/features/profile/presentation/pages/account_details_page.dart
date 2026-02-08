import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/delete_account_sequence_sheet.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

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
                'Account details',
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
      body: Column(
        children: [
          // Get verified banner
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
                  color: const Color(0xFFFB84A3),
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.verified_user, size: 16, color: Color(0xFFFB84A3)),
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  // Personal Info Section
                  const Text(
                    'Personal info',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro',
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildUnderlineTextField('Your First name'),
                  const SizedBox(height: 12),
                  _buildUnderlineTextField('Your Last name'),
                  const SizedBox(height: 12),
                  _buildUnderlineTextField('Fotodinomail@gmail.com'),
                  const SizedBox(height: 32),
                  // Citizen of Section
                  const Text(
                    'Citizen of',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFACA9A9), width: 0.5)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.flag, size: 24, color: Colors.black),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Germany',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Color(0xFF333333)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  // Delete My Account
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const DeleteAccountSequenceSheet(),
                        );
                      },
                      icon: const Icon(Icons.delete_outline, color: Color(0xFFACA9A9), size: 20),
                      label: const Text(
                        'Delete my account',
                        style: TextStyle(
                          color: Color(0xFFACA9A9),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bottom Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFE8E5E5)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Discard', style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E1E1E),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text('Save changes', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnderlineTextField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFACA9A9), width: 0.5)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFACA9A9), fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
        style: const TextStyle(color: Color(0xFFACA9A9), fontSize: 14),
      ),
    );
  }
}
