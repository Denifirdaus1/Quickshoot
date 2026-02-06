import 'package:flutter/material.dart';

class PhotographerFilterSheet extends StatefulWidget {
  const PhotographerFilterSheet({super.key});

  @override
  State<PhotographerFilterSheet> createState() => _PhotographerFilterSheetState();
}

class _PhotographerFilterSheetState extends State<PhotographerFilterSheet> {
  double _maxPrice = 20.0;
  String _selectedGender = 'Male';
  bool _isFreePic = false;
  final Set<String> _selectedCategories = {'Street'};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F252525),
            blurRadius: 5,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          // Handle bar
          Center(
            child: Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFACA9A9),
                borderRadius: BorderRadius.circular(91.6),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Photographer Filter',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF Pro',
                    letterSpacing: -0.32,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24, color: Color(0xFF333333)),
                ),
              ],
            ),
          ),
          const Divider(height: 24, color: Color(0xFFE8E5E5)),

          // Main Filter Options
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildToggleOption(
                  'Free Pic',
                  'assets/icon/fluent_fire-16-filled.png',
                  _isFreePic,
                  () => setState(() => _isFreePic = !_isFreePic),
                ),
                const SizedBox(width: 8),
                _buildGenderOption('Male', Icons.male, _selectedGender == 'Male'),
                const SizedBox(width: 8),
                _buildGenderOption('Female', Icons.female, _selectedGender == 'Female'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Categories Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Color(0xFFACA9A9),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.24,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                'Street', 'Lifestyle', 'Health', 'Travel', 'Pets',
                'Fitness', 'Food', 'Education', 'Fashion', 'Technology',
                'Wellness', 'Beauty', 'Home Decor', 'Finance'
              ].map((cat) => _buildCategoryTag(cat)).toList(),
            ),
          ),

          const SizedBox(height: 24),

          // Price Slider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'price per file',
              style: TextStyle(
                color: Color(0xFFACA9A9),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.24,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                activeTrackColor: const Color(0xFF101010),
                inactiveTrackColor: const Color(0xFFF5F5F5),
                thumbColor: const Color(0xFF101010),
                overlayColor: const Color(0x1F101010),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Slider(
                    value: _maxPrice,
                    max: 100,
                    onChanged: (val) => setState(() => _maxPrice = val),
                  ),
                  // Simple Tooltip logic
                  Positioned(
                    top: -30,
                    left: (_maxPrice / 100) * (MediaQuery.of(context).size.width - 64),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDFDFD),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                      ),
                      child: Text(
                        'max €${_maxPrice.toInt()}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE8E5E5)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Reset', style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
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
                    child: const Text('Apply', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String label, String iconAsset, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333333) : Colors.white,
          border: isSelected ? null : Border.all(color: const Color(0xFFE8E5E5)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Image.asset(iconAsset, width: 16, height: 16, color: isSelected ? Colors.white : const Color(0xFFACA9A9)),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFACA9A9),
                fontSize: 14,
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = label),
      child: Container(
        height: 44,
        width: 106,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333333) : Colors.white,
          border: isSelected ? null : Border.all(color: const Color(0xFFE8E5E5)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: isSelected ? Colors.white : const Color(0xFFACA9A9)),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFACA9A9),
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String label) {
    final isSelected = _selectedCategories.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedCategories.remove(label);
          } else {
            _selectedCategories.add(label);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333333) : Colors.transparent,
          border: isSelected ? null : Border.all(color: const Color(0xFFE8E5E5)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFACA9A9),
            fontSize: 14,
            fontFamily: 'SF Pro',
          ),
        ),
      ),
    );
  }
}
