import 'package:collection/collection.dart';
import 'package:ecom_project/widgets/home/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constants/styling.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_row_search_field.dart';
import '../widgets/scaffold_customed.dart';

class StaggeredTile {
  const StaggeredTile({
    required this.crossAxisCount,
    required this.mainAxisCount,
  });

  final int crossAxisCount;
  final int mainAxisCount;
}

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<StaggeredTile> _list = [];

  void _generateList() {
    for (int i = 0; i < 5 * 2; i++) {
      if (i.isEven) {
        _list.add(const StaggeredTile(crossAxisCount: 2, mainAxisCount: 3));
      } else {
        _list.add(const StaggeredTile(crossAxisCount: 2, mainAxisCount: 1));
      }
    }
    setState(() {});
  }

  // TODO: continue refactor this

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustomed(
      hasAppBar: false,
      child: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          CustomRowSearchField(
            leadingWidget: Padding(
              padding: EdgeInsets.only(left: sidePadding),
              child: const CustomBackButton(),
            ),
            onSubmitted: (value) {},
          ),
          Expanded(
            child: _list.isEmpty
                ? TextButton(
                    onPressed: _generateList,
                    child: Text('generate'),
                  )
                : SingleChildScrollView(
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      children: [
                        ..._list.mapIndexed(
                          (index, tile) {
                            late Widget child;
                            if (index.isEven) {
                              child = const ProductCard(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                              );
                            } else {
                              child = Container(color: Colors.transparent);
                            }

                            return StaggeredGridTile.count(
                              crossAxisCellCount: tile.crossAxisCount,
                              mainAxisCellCount: tile.mainAxisCount,
                              child: SizedBox(
                                height: tile.crossAxisCount * 5,
                                width: tile.mainAxisCount * 5,
                                child: child,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
