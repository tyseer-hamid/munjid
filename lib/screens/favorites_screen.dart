import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/emergency_data.dart';
import '../models/emergency_item.dart';
import '../theme/app_theme.dart';
import 'emergency_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<EmergencyItem> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favorites') ?? [];
    final items = ids
        .map((id) => EmergencyData.getById(id))
        .whereType<EmergencyItem>()
        .toList();
    setState(() {
      _favorites = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المفضلة')),
      body: _favorites.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border_rounded,
                      size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد حالات محفوظة بعد',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'اضغط على أيقونة الحفظ في أي حالة لإضافتها هنا',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final item = _favorites[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    leading: const Icon(Icons.bookmark_rounded,
                        color: AppTheme.softRed),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(item.category,
                        style: const TextStyle(color: Colors.grey)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 18, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EmergencyDetailScreen(itemId: item.id),
                        ),
                      ).then((_) => _loadFavorites());
                    },
                  ),
                );
              },
            ),
    );
  }
}