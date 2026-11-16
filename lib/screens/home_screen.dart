import 'package:flutter/material.dart';
import '../data/emergency_data.dart';
import '../models/emergency_item.dart';
import '../theme/app_theme.dart';
import 'category_items_screen.dart';
import 'emergency_contacts_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import 'emergency_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<EmergencyItem> _searchResults = [];
  bool _isSearching = false;

  void _onSearchChanged(String value) {
    final results = EmergencyData.search(value);
    setState(() {
      _searchResults = results;
      _isSearching = value.trim().isNotEmpty;
    });
  }

  IconData _categoryIcon(String iconName) {
    switch (iconName) {
      case 'burn':
        return Icons.local_fire_department_rounded;
      case 'choking':
        return Icons.air_rounded;
      case 'poisoning':
        return Icons.science_rounded;
      case 'fracture':
        return Icons.healing_rounded;
      case 'fainting':
        return Icons.sentiment_very_dissatisfied_rounded;
      default:
        return Icons.medical_services_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مُنْجِد'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_rounded, color: AppTheme.softRed),
            tooltip: 'المفضلة',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'عن التطبيق',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'ابحث عن حالة طارئة...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(Icons.search_rounded, size: 28),
                suffixIcon: _isSearching
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Search Results
            if (_isSearching) ...[
              if (_searchResults.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'لا توجد نتائج مطابقة',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                )
              else
                ..._searchResults.map((item) => Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const Icon(Icons.medical_services_rounded,
                            color: AppTheme.calmBlue),
                        title: Text(item.title,
                            style: const TextStyle(fontSize: 18)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  EmergencyDetailScreen(itemId: item.id),
                            ),
                          );
                        },
                      ),
                    )),
            ] else ...[
              // Emergency Call Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const EmergencyContactsScreen()),
                  );
                },
                icon: const Icon(Icons.phone_in_talk_rounded, size: 28),
                label: const Text('أرقام الطوارئ'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.softRed,
                  minimumSize: const Size(double.infinity, 58),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'الأقسام الرئيسية',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: EmergencyData.categories.length,
                itemBuilder: (context, index) {
                  final cat = EmergencyData.categories[index];
                  return Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CategoryItemsScreen(categoryName: cat.name),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _categoryIcon(cat.iconName),
                            size: 44,
                            color: AppTheme.calmBlue,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cat.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.darkText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}