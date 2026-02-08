import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _selectedGender = 'Female';
  final TextEditingController _usernameController = TextEditingController(text: 'Josephine');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFDFD),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                'Edit profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Profile Image Section
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFB84A3),
                          width: 2.85,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/img/67aeee2e75ad2b4e9803bc99fc4cd86c45703401.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withValues(alpha: 0.2),
                            ),
                          ),
                          const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt, color: Colors.white, size: 30),
                                Text(
                                  'Change image',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Outfit',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Trash Icon
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1F000000),
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          color: Color(0xFF333333),
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Username Field
              const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter username',
                  hintStyle: TextStyle(color: Color(0xFFACA9A9)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFACA9A9), width: 0.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFB84A3)),
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFFACA9A9),
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '*Write at least 3 letters',
                style: TextStyle(
                  color: Color(0xFFED1F24),
                  fontSize: 12,
                  fontFamily: 'SF Pro',
                ),
              ),
              const SizedBox(height: 32),
              // Gender Section
              const Text(
                'Gender',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildGenderPill('Male', Icons.male_outlined),
                  const SizedBox(width: 8),
                  _buildGenderPill('Female', Icons.female_outlined),
                  const SizedBox(width: 8),
                  _buildGenderPill('Non Binary', Icons.adjust),
                ],
              ),
              const SizedBox(height: 48),
              // Link to Account Details
              Center(
                child: TextButton(
                  onPressed: () => context.pushNamed('account_details'),
                  child: const Text(
                    'Edit account details',
                    style: TextStyle(
                      color: Color(0xFFFB84A3),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      fontFamily: 'SF Pro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderPill(String label, IconData icon) {
    bool isSelected = _selectedGender == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E1E1E) : const Color(0xFFE8E5E5),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFACA9A9),
                fontSize: 14,
                fontFamily: 'SF Pro',
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : const Color(0xFFACA9A9),
            ),
          ],
        ),
      ),
    );
  }
}
