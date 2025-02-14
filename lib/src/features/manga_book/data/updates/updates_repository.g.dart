// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updates_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$updatesRepositoryHash() => r'7137ec4e542f1b7b9e5f9d74abcc570b100530d0';

/// See also [updatesRepository].
final updatesRepositoryProvider = AutoDisposeProvider<UpdatesRepository>(
  updatesRepository,
  name: r'updatesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updatesRepositoryHash,
);
typedef UpdatesRepositoryRef = AutoDisposeProviderRef<UpdatesRepository>;
String _$updateSummaryHash() => r'cd04991640fe6971183b65daf9e45e9445205800';

/// See also [updateSummary].
final updateSummaryProvider = AutoDisposeFutureProvider<UpdateStatus?>(
  updateSummary,
  name: r'updateSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateSummaryHash,
);
typedef UpdateSummaryRef = AutoDisposeFutureProviderRef<UpdateStatus?>;
