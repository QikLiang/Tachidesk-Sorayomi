// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../constants/db_keys.dart';
import '../../../../../../i18n/locale_keys.g.dart';
import '../../../../../../utils/storage/local/shared_preferences_client.dart';

part 'show_nsfw_switch.g.dart';

@riverpod
class ShowNSFW extends _$ShowNSFW with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        ref,
        key: DBKeys.showNSFW.name,
        initial: DBKeys.showNSFW.initial,
      );
}

class ShowNSFWTile extends ConsumerWidget {
  const ShowNSFWTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.eighteen_up_rating_rounded),
      title: Text(
        LocaleKeys.nsfw_title.tr(),
      ),
      subtitle: Text(LocaleKeys.nsfw_subtitle.tr()),
      onChanged: ref.read(showNSFWProvider.notifier).update,
      value: ref.watch(showNSFWProvider) ?? false,
    );
  }
}
