import 'package:flutter/material.dart';

class FileReportSheet extends StatefulWidget {
  final bool alreadyReported;
  const FileReportSheet({super.key, this.alreadyReported = false});

  @override
  State<FileReportSheet> createState() => _FileReportSheetState();
}

class _FileReportSheetState extends State<FileReportSheet> {
  int _currentStep = 0; // 0: Form, 1: Success
  String? _selectedReason;
  bool _showDropdown = false;
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.alreadyReported) {
      _currentStep = -1; // Special state for "Already Reported"
    }
  }

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
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (_currentStep == -1) return _buildAlreadyReportedStep();
    
    switch (_currentStep) {
      case 0:
        return _buildReportFormStep();
      case 1:
        return _buildSuccessStep();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildAlreadyReportedStep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        key: const ValueKey(-1),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon from design 2817:10478
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFF101010),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.info_outline, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 16),
          const Text(
            'Already Reported',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'You have already submitted a report for this file. Our team is reviewing it.',
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
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Done', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportFormStep() {
    return SingleChildScrollView(
      key: const ValueKey(0),
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
            // Header with close button
            Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Issue with this file?',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4,
                        ),
                      ),
                      Text(
                        'Tell us what happened',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Color(0xFF333333), size: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Reason Dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tell us why?',
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            const SizedBox(height: 11),
            GestureDetector(
              onTap: () => setState(() => _showDropdown = !_showDropdown),
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
                          color: _selectedReason == null ? const Color(0xFFACA9A9) : const Color(0xFF1E1E1E),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF333333)),
                  ],
                ),
              ),
            ),
            if (_showDropdown)
              Container(
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 9, offset: Offset(0, 2)),
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
                style: const TextStyle(color: Color(0xFF1E1E1E), fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Write a reason....',
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
                  '* min 20 Letters required',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 12),
                ),
              ),
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
                const SizedBox(width: 11),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(String text, {bool isLast = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReason = text;
          _showDropdown = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: isLast ? null : const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5F5F5))),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFF333333), fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildSuccessStep() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        key: const ValueKey(1),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon from design 1280:9669
          const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 44),
          const SizedBox(height: 16),
          const Text(
            'Report Sent',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Thank you for your report. We will review it shortly.',
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
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E1E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Done', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
