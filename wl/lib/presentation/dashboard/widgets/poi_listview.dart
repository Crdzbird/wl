import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wl/data/enums/pages.enum.dart';
import 'package:wl/data/extensions/build_context.extension.dart';
import 'package:wl/data/extensions/string.extension.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/presentation/dashboard/widgets/poi_card.dart';

class PoiListView extends StatelessWidget {
  const PoiListView(List<Stadium> stadiums, {super.key}) : _stadiums = stadiums;

  final List<Stadium> _stadiums;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => PoiCard(
          _stadiums[index],
          onTap: () => context.router.pushNamed(
            PagesEnum.detail.path.replaceParams([_stadiums[index].id]),
          ),
        ),
        separatorBuilder: (context, _) => Divider(
          indent: context.width * .1,
          endIndent: context.width * .1,
          thickness: .5,
        ),
        itemCount: _stadiums.length,
      ),
    );
  }
}
