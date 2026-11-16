class EmergencyStep {
  final int order;
  final String text;

  EmergencyStep({required this.order, required this.text});
}

class EmergencyItem {
  final String id;
  final String category;
  final String title;
  final String warning;
  final List<EmergencyStep> steps;
  final String videoAsset;

  EmergencyItem({
    required this.id,
    required this.category,
    required this.title,
    required this.warning,
    required this.steps,
    required this.videoAsset,
  });
}

class EmergencyCategory {
  final String name;
  final String iconName;

  EmergencyCategory({required this.name, required this.iconName});
}
