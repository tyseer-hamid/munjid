import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../data/emergency_data.dart';
import '../models/emergency_item.dart';
import '../theme/app_theme.dart';

class EmergencyDetailScreen extends StatefulWidget {
  final String itemId;

  const EmergencyDetailScreen({super.key, required this.itemId});

  @override
  State<EmergencyDetailScreen> createState() => _EmergencyDetailScreenState();
}

class _EmergencyDetailScreenState extends State<EmergencyDetailScreen> {
  EmergencyItem? _item;
  bool _isFavorite = false;
  VideoPlayerController? _videoController;
  bool _videoInitialized = false;
  bool _videoError = false;

  @override
  void initState() {
    super.initState();
    _item = EmergencyData.getById(widget.itemId);
    _loadFavorite();
    _initVideo();
  }

  Future<void> _loadFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favorites') ?? [];
    setState(() {
      _isFavorite = favs.contains(widget.itemId);
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favorites') ?? [];
    setState(() {
      if (_isFavorite) {
        favs.remove(widget.itemId);
        _isFavorite = false;
      } else {
        favs.add(widget.itemId);
        _isFavorite = true;
      }
    });
    await prefs.setStringList('favorites', favs);
  }

  Future<void> _initVideo() async {
    if (_item == null) return;
    try {
      final controller = VideoPlayerController.asset(_item!.videoAsset);
      await controller.initialize();
      controller.setLooping(true);
      await controller.play();
      setState(() {
        _videoController = controller;
        _videoInitialized = true;
      });
    } catch (e) {
      setState(() {
        _videoError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('خطأ')),
        body: const Center(child: Text('الحالة غير موجودة')),
      );
    }

    final item = _item!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الحالة'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: AppTheme.softRed,
              size: 28,
            ),
            tooltip: _isFavorite ? 'إزالة من المفضلة' : 'إضافة للمفضلة',
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            // Video / Animation Guide
            if (_videoInitialized && _videoController != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                ),
              )
            else if (_videoError)
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: AppTheme.calmBlue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_outline_rounded,
                        size: 56, color: AppTheme.calmBlue),
                    SizedBox(height: 8),
                    Text('الدليل المرئي غير متوفر حالياً',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: AppTheme.calmBlue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),

            const SizedBox(height: 24),

            // Warning Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.softRed.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: AppTheme.softRed.withOpacity(0.3), width: 1.5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: AppTheme.softRed, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '⚠️ أمور يجب تجنبها فوراً',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.softRed,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.warning,
                          style: const TextStyle(
                              fontSize: 16, height: 1.6, color: AppTheme.darkText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Steps
            const Text(
              'خطوات الإسعاف',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
              ),
            ),
            const SizedBox(height: 12),
            ...item.steps.map((step) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppTheme.calmBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${step.order}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          step.text,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.7,
                            color: AppTheme.darkText,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}