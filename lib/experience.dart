import 'package:flutter/material.dart';

import 'landing_label.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView(
    this.experiences, {
    Key? key,
  }) : super(key: key);

  final List<ExperienceViewData> experiences;

  @override
  Widget build(BuildContext context) {
    return ExperienceListView(
      items: experiences,
      onItemTap: (_) {
        debugPrint('TODO: Implement');
      },
    );
  }
}

class ExperienceViewData {
  ExperienceViewData({
    required this.title,
    required this.companyName,
    required this.employmentType,
    required this.startDate,
    required this.endDate,
    this.technologiesUsed = const [],
  });

  final String title;
  final String companyName;
  final String employmentType;
  final String startDate;
  final String endDate;
  final List<String> technologiesUsed;

  static ExperienceViewData fromJson(Map json) {
    return ExperienceViewData(
      title: json['title'],
      companyName: json['company_name'],
      endDate: json['end_date'],
      startDate: json['start_date'],
      employmentType: json['employment_type'],
    );
  }
}

class ExperienceListView extends StatelessWidget {
  const ExperienceListView({
    Key? key,
    this.items = const <ExperienceViewData>[],
    required this.onItemTap,
  }) : super(key: key);

  final List<ExperienceViewData> items;
  final Function(ExperienceViewData) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final data = items[index];
        return ExperienceViewItem(
          data: data,
          onItemTap: onItemTap,
        );
      },
    );
  }
}

class ExperienceViewItem extends StatelessWidget {
  const ExperienceViewItem({
    Key? key,
    required this.data,
    required this.onItemTap,
  }) : super(key: key);

  final Function(ExperienceViewData) onItemTap;
  final ExperienceViewData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: LandingLabel(data.title),
        subtitle: Column(
          children: [
            Row(
              children: [
                LandingLabel(data.companyName),
                const LandingLabel(' – '),
                LandingLabel(data.employmentType),
              ],
            ),
            Row(
              children: [
                LandingLabel(data.startDate),
                const LandingLabel(' – '),
                LandingLabel(data.endDate)
              ],
            )
          ],
        ),
      ),
    );
  }
}
