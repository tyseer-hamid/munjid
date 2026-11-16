import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عن التطبيق')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.calmBlue.withOpacity(0.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Icon(Icons.health_and_safety_rounded,
                    size: 60, color: AppTheme.calmBlue),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'مُنْجِد',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkText,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'المساعد الأمين في كل طارئ',
                style: TextStyle(fontSize: 18, color: AppTheme.calmBlue),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'إخلاء المسؤولية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.softRed,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.softRed.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppTheme.softRed.withOpacity(0.2)),
              ),
              child: const Text(
                'هذا التطبيق استرشادي للطوارئ المنزلية فقط. المعلومات الواردة فيه لا تغني عن استشارة الطبيب المختص أو الاتصال بخدمات الإسعاف عند الحاجة.\n\n'
                'في الحالات الحرجة أو عند الشك، اتصل فوراً برقم الإسعاف المحلي (997 أو ما يعادله في بلدك).\n\n'
                'المطور غير مسؤول عن أي سوء استخدام للمعلومات الواردة في التطبيق.',
                style: TextStyle(
                    fontSize: 16, height: 1.7, color: AppTheme.darkText),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'معلومات التطبيق',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
              ),
            ),
            const SizedBox(height: 12),
            _infoRow('الإصدار', '1.0.0'),
            _infoRow('وضع العمل', 'يعمل أوفلاين تماماً'),
            _infoRow('اللغة', 'العربية'),
            _infoRow('عدد الحالات', '15 حالة إسعافية'),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'صُنع بحب لسلامتكم',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.calmBlue),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 16, color: AppTheme.darkText),
            ),
          ),
        ],
      ),
    );
  }
}