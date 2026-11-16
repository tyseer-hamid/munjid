import 'package:flutter/material.dart';
import '../data/emergency_data.dart';
import '../theme/app_theme.dart';
import 'emergency_detail_screen.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryItemsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final items = EmergencyData.getByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: items.isEmpty
          ? const Center(
              child: Text('لا توجد حالات في هذا القسم',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.calmBlue.withOpacity(0.1),
                      child: const Icon(Icons.medical_services_rounded,
                          color: AppTheme.calmBlue),
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 18, color: Colors.grey),
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
                );
              },
            ),
    );
  }
}