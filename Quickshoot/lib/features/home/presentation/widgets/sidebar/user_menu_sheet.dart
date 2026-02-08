import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserMenuSheet extends StatefulWidget {
  const UserMenuSheet({super.key});

  @override
  State<UserMenuSheet> createState() => _UserMenuSheetState();
}

class _UserMenuSheetState extends State<UserMenuSheet> {
  String? _expandedMenu;

  void _toggleMenu(String menu) {
    setState(() {
      if (_expandedMenu == menu) {
        _expandedMenu = null;
      } else {
        _expandedMenu = menu;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(0)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE8E5E5), width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  // Avatar with Online Dot
                  Stack(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF73A1D9),
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
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Name and User ID
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Emilia',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.verified,
                              color: Color(0xFFFB84A3),
                              size: 16,
                            ),
                          ],
                        ),
                        const Text(
                          'user id: us2548643',
                          style: TextStyle(
                            color: Color(0xFFACA9A9),
                            fontSize: 12,
                            fontFamily: 'SF Pro',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Share Icon
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Color(0xFFFB84A3),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  _buildMenuItem(
                    customIcon: Image.asset(
                      'assets/icon/Group.png',
                      width: 24,
                      height: 24,
                      color: const Color(0xFFACA9A9),
                    ),
                    label: 'Shoots',
                    notificationCount: 1,
                    onTap: () => context.pushNamed('my_shoots'),
                  ),
                  _buildMenuItem(
                    customIcon: Image.asset(
                      'assets/icon/mynaui_chat-dots.png',
                      width: 24,
                      height: 24,
                      color: const Color(0xFFACA9A9),
                    ),
                    label: 'Chats',
                    notificationCount: 1,
                    onTap: () => context.pushNamed('inbox'),
                  ),
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    onTap: () => context.pushNamed('profile'),
                  ),
                  const SizedBox(height: 12),
                  // Purchases (Highlighted)
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFF8E8E8E),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Since we don't have the exact asset with the dollar sign,
                              // we'll use a stack to approximate it or a standard icon.
                              // Using a standard icon for now as placeholder or closest match.
                              // If a specific asset is available later, it can be updated.
                              const Icon(
                                Icons.image_outlined,
                                color: Color(0xFFACA9A9),
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Purchases',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // New Feature Badge
                        Positioned(
                          right: 16,
                          top: -10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF666666),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'New feature 02',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Collapsible Items
                  _buildExpandableItem(
                    label: 'Support',
                    icon: Icons.help_outline,
                    isExpanded: _expandedMenu == 'support',
                    onTap: () => _toggleMenu('support'),
                    children: [_buildSubItem('FAQ', () {})],
                  ),
                  _buildExpandableItem(
                    label: 'Account settings',
                    icon: Icons.manage_accounts_outlined,
                    isExpanded: _expandedMenu == 'account',
                    onTap: () => _toggleMenu('account'),
                    children: [
                      _buildSubItem(
                        'Account details',
                        () => context.pushNamed('account_details'),
                      ),
                      _buildSubItem('Notification Settings', () {}),
                      _buildSubItem('Delete Account', () {}),
                    ],
                  ),
                  _buildExpandableItem(
                    label: 'About us',
                    icon: Icons.people_outline,
                    isExpanded: _expandedMenu == 'about',
                    onTap: () => _toggleMenu('about'),
                    children: [
                      _buildSubItem('Trust and safety', () {}),
                      _buildSubItem('Charity', () {}),
                    ],
                  ),
                  _buildExpandableItem(
                    label: 'Legal',
                    icon: Icons.shield_outlined,
                    isExpanded: _expandedMenu == 'legal',
                    onTap: () => _toggleMenu('legal'),
                    children: [
                      _buildSubItem('Data Privacy', () {}),
                      _buildSubItem('Terms and Conditions', () {}),
                    ],
                  ),

                  // Language
                  _buildExpandableItem(
                    label: 'German',
                    customIcon: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text('🇩🇪', style: TextStyle(fontSize: 24)),
                    ),
                    isExpanded: _expandedMenu == 'language',
                    onTap: () => _toggleMenu('language'),
                    children: [
                      _buildLanguageSubItem('Djibouti', '🇩🇯'),
                      _buildLanguageSubItem('Malaysia', '🇲🇾'),
                      _buildLanguageSubItem('Urdu', '🇵🇰'),
                      _buildLanguageSubItem('German', '🇩🇪', isSelected: true),
                      _buildLanguageSubItem('Thai', '🇹🇭'),
                      _buildLanguageSubItem('Slovakia', '🇸🇰'),
                      _buildLanguageSubItem('Dominica', '🇩🇲'),
                      _buildLanguageSubItem('Honduras', '🇭🇳'),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF73A1D9)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Join as a Photographer',
                        style: TextStyle(
                          color: Color(0xFF73A1D9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout, color: Color(0xFFACA9A9)),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xFFACA9A9),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    Widget? customIcon,
    required String label,
    int? notificationCount,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          customIcon ?? Icon(icon, color: const Color(0xFFACA9A9), size: 24),
          if (notificationCount != null)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFFB84A3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF333333),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExpandableItem({
    required String label,
    required bool isExpanded,
    required VoidCallback onTap,
    IconData? icon,
    Widget? customIcon,
    List<Widget> children = const [],
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          leading:
              customIcon ??
              Icon(icon, color: const Color(0xFFACA9A9), size: 24),
          title: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: const Color(0xFFACA9A9),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xFFE8E5E5), width: 1),
                ),
              ),
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSubItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSubItem(
    String name,
    String flag, {
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF333333)
                    : const Color(0xFFAAAAAA),
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
