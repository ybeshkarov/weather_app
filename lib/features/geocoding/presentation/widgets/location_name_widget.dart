import 'package:flutter/material.dart';

class LocationNameWidget extends StatelessWidget {
  const LocationNameWidget({required this.locationName, super.key});

  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Text(
      locationName,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
