// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../domain/filter/filter_model.dart';
import 'filter_to_widget.dart';

class SourceMangaFilter extends HookWidget {
  const SourceMangaFilter({
    super.key,
    required this.initialFilters,
    required this.sourceId,
    required this.onSubmitted,
    required this.onReset,
  });
  final List<Filter> initialFilters;
  final String sourceId;
  final ValueChanged<List<Filter>?> onSubmitted;
  final VoidCallback onReset;
  @override
  Widget build(BuildContext context) {
    final filters = useState(initialFilters);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarBottomHeight),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  onReset();
                  filters.value = initialFilters;
                },
                child: Text(LocaleKeys.reset.tr()),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => onSubmitted(filters.value),
                child: Text(LocaleKeys.filter.tr()),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final filter = filters.value[index];
          return FilterToWidget(
            key: ValueKey("Filter-${filter.filterState?.name}"),
            filter: filter,
            onChanged: (value) {
              filters.value = ([...initialFilters]..replaceRange(
                  index,
                  index + 1,
                  [value],
                ));
            },
          );
        },
        itemCount: filters.value.length,
      ),
    );
  }
}
