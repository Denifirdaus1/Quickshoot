import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/home_header.dart';
import '../widgets/photographer_profile_sheet.dart';
import '../widgets/photographer_filter_sheet.dart';
import '../widgets/map_photographer_card.dart';

class MapOfPhotographyPage extends StatefulWidget {
  const MapOfPhotographyPage({super.key});

  @override
  State<MapOfPhotographyPage> createState() => _MapOfPhotographyPageState();
}

class _MapOfPhotographyPageState extends State<MapOfPhotographyPage> {
  bool _isProfileOpen = false;
  final DraggableScrollableController _sheetController = DraggableScrollableController();

  void _toggleProfile(bool open) {
    setState(() {
      _isProfileOpen = open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // 1. Map View
            Positioned.fill(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(48.8566, 2.3522), // Paris
                  initialZoom: 13,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.quickshoot.app',
                  ),
                ],
              ),
            ),

            // 2. Default Overlays (Only when profile is closed)
            if (!_isProfileOpen) ...[
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    border: Border.all(color: const Color(0xFFE8E5E5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon/ShieldCheck.png', width: 16, height: 16, color: Colors.black),
                      const SizedBox(width: 3),
                      const Text('Safe shoots worldwide', style: TextStyle(color: Color(0xFF1E1E1E), fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const Positioned(top: 0, left: 0, right: 0, child: HomeHeader()),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 13, bottom: 32),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(child: Text('Photographers near you', style: TextStyle(color: Color(0xFFFDFDFD), fontSize: 16, fontWeight: FontWeight.w600))),
                            _buildIconButton('assets/icon/Vector.png'),
                            const SizedBox(width: 8),
                            _buildIconButton('assets/icon/Vector1.png'),
                            const SizedBox(width: 8),
                            _buildFilterButton(context),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 194,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => _toggleProfile(true),
                            child: const MapPhotographerCard(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            // 3. Profile View using DraggableScrollableSheet
            if (_isProfileOpen) ...[
              // Back Button & Distance Indicator (Fixed Overlays)
              Positioned(
                top: 0,
                left: 16,
                child: GestureDetector(
                  onTap: () => _toggleProfile(false),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 4))],
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF333333)),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 16,
                child: Container(
                  width: 61,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFE8E5E5)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFFACA9A9)),
                      const Text('50 m', style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w600)),
                      const Text('Away', style: TextStyle(color: Color(0xFF333333), fontSize: 12)),
                    ],
                  ),
                ),
              ),

              // The Sheet
              NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent <= notification.minExtent - 0.05) {
                    _toggleProfile(false);
                  }
                  return true;
                },
                child: DraggableScrollableSheet(
                  controller: _sheetController,
                  initialChildSize: 0.6,
                  minChildSize: 0.45, // Allow dragging down a bit to close
                  maxChildSize: 0.8,
                  snap: true,
                  snapSizes: const [0.6, 0.8],
                  builder: (context, scrollController) {
                    return PhotographerProfileSheet(
                      controller: scrollController,
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Center(
        child: Image.asset(
          assetPath,
          width: 20, // Small size
          height: 20,
          color: Colors.white,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const PhotographerFilterSheet(),
        );
      },
      child: SizedBox(
        width: 44,
        height: 44,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/icon/hugeicons_filter-horizontal.png',
              width: 20, // Small size
              height: 20,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
            Positioned(
              right: 8,
              top: 10,
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: const Color(0xFFFB84A3),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1E1E1E), width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}