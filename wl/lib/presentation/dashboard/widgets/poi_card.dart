import 'package:flutter/material.dart';
import 'package:wl/core/l10n/l10n.dart';
import 'package:wl/data/models/stadiums/stadium.dart';

class PoiCard extends StatelessWidget {
  const PoiCard(Stadium stadium, {VoidCallback? onTap, super.key})
      : _stadium = stadium,
        _onTap = onTap;
  final Stadium _stadium;
  final VoidCallback? _onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_stadium.title),
      subtitle: Text(context.l10n.coordinates(_stadium.geocoordinates)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_stadium.image),
      ),
      onTap: _onTap,
    );
  }
}
