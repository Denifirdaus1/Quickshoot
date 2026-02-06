import 'package:flutter/material.dart';

class ReportSheet extends StatefulWidget {
  const ReportSheet({super.key});

  @override
  State<ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<ReportSheet> {
  int _currentStep = 0;
  String? _selectedReason;
  bool _showReasonDropdown = false;
  final TextEditingController _reasonController = TextEditingController();

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
  }

  void _reset() {
    setState(() {
      _currentStep = 0;
      _selectedReason = null;
      _showReasonDropdown = false;
      _reasonController.clear();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            const SizedBox(height: 8),
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E5E5),
                borderRadius: BorderRadius.circular(91.6),
              ),
            ),
            
            // Content
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildStepContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildStep1Menu();
      case 1:
        return _buildStep2Form();
      case 2:
        return _buildStep3Success();
      default:
        return const SizedBox.shrink();
    }
  }

  // Stage 1: Menu Options
  Widget _buildStep1Menu() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _nextStep,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.network(
                    'https://www.figma.com/api/mcp/asset/4e66491b-307e-4923-a598-0a18958cc1d8',
                    width: 24,
                    height: 24,
                    color: const Color(0xFF989898),
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.report_outlined, size: 24, color: Color(0xFF989898)),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Report (Review)',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      color: Color(0xFF989898),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE8E5E5)),
        ],
      ),
    );
  }

  // Stage 2: Report Form (combines stages 2 & 4 logic)
  Widget _buildStep2Form() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40), // spacer for alignment
              const Text(
                'Report Photographer',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                  letterSpacing: -0.4,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Color(0xFF333333)),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Dropdown Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tell us why?',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
                letterSpacing: -0.28,
              ),
            ),
          ),
          const SizedBox(height: 11),
          
          GestureDetector(
            onTap: () {
              setState(() {
                _showReasonDropdown = !_showReasonDropdown;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE8E5E5)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedReason ?? 'Select Reason',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 14,
                        color: _selectedReason != null 
                            ? const Color(0xFF1E1E1E) 
                            : const Color(0xFFACA9A9),
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Color(0xFF333333)),
                ],
              ),
            ),
          ),

          // Stage 4: Dropdown Menu (conditionally shown)
          if (_showReasonDropdown) ...[
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, -2),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDropdownItem('Report a Photographer'),
                  _buildDropdownItem('Report a user'),
                  _buildDropdownItem('technical issue with the app'),
                  _buildDropdownItem('something else', isLast: true),
                ],
              ),
            ),
          ],

          if (_selectedReason == null && !_showReasonDropdown)
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  '* please select a reason',
                  style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                ),
              ),
            ),

          const SizedBox(height: 12),

          // Text Area
          Container(
            height: 100,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE8E5E5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _reasonController,
              maxLines: null,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 14,
                color: Color(0xFF1E1E1E), // Black text
                letterSpacing: -0.28,
              ),
              decoration: const InputDecoration(
                hintText: 'Write a reason....',
                hintStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 14,
                  color: Color(0xFFACA9A9),
                  letterSpacing: -0.28,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                '* min 20 Letters required',
                style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Buttons
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
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF666666),
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _nextStep(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E1E),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFDFDFD),
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(String text, {bool isLast = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReason = text;
          _showReasonDropdown = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: isLast ? null : const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5F5F5))),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 12,
            fontWeight: text == 'Report a Photographer' ? FontWeight.w500 : FontWeight.w400,
            color: text == 'Report a Photographer' 
                ? const Color(0xFF1E1E1E) 
                : const Color(0xFFACA9A9),
            letterSpacing: -0.24,
          ),
        ),
      ),
    );
  }

  // Stage 3 & 5: Success Modal (Unified)
  Widget _buildStep3Success() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Image.network(
            'https://www.figma.com/api/mcp/asset/2b649e74-e259-444c-b4c5-399ac6fba4cb',
            width: 44,
            height: 44,
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.check_circle, size: 44, color: Colors.green),
          ),
          const SizedBox(height: 16),
          const Text(
            'Thank You for Reporting',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'We will review your report and take necessary actions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14,
              color: Color(0xFF333333),
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Done',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFDFDFD),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
