import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  final List<Map<String, String>> _contacts = const [
    {'name': 'الإسعاف', 'number': '997', 'icon': 'ambulance'},
    {'name': 'الشرطة', 'number': '999', 'icon': 'police'},
    {'name': 'الدفاع المدني', 'number': '998', 'icon': 'fire'},
    {'name': 'مركز السموم', 'number': '010', 'icon': 'poison'},
    {'name': 'الهلال الأحمر', 'number': '997', 'icon': 'red_crescent'},
  ];

  IconData _getIcon(String icon) {
    switch (icon) {
      case 'ambulance':
        return Icons.local_hospital_rounded;
      case 'police':
        return Icons.local_police_rounded;
      case 'fire':
        return Icons.local_fire_department_rounded;
      case 'poison':
        return Icons.science_rounded;
      case 'red_crescent':
        return Icons.favorite_rounded;
      default:
        return Icons.phone_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أرقام الطوارئ')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.softRed.withOpacity(0.1),
                child: Icon(
                  _getIcon(contact['icon']!),
                  color: AppTheme.softRed,
                  size: 28,
                ),
              ),
              title: Text(
                contact['name']!,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                contact['number']!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              trailing: ElevatedButton.icon(
                onPressed: () {
                  // في Flutter Web لا يعمل url_launcher للاتصال المباشر.
                  // هذا الزر يعرض الرقم لتسهيل الاتصال يدوياً.
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(contact['name']!),
                      content: Text(
                        'الرقم: ${contact['number']}\n\n'
                        'اتصل بهذا الرقم من هاتفك مباشرة.',
                        style: const TextStyle(fontSize: 18, height: 1.6),
                        textDirection: TextDirection.rtl,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('حسناً'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.call_rounded, size: 20),
                label: const Text('اتصال'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.softRed,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(100, 44),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}