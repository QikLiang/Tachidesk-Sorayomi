#!/usr/bin/env bash

printf "\e[33;1m%s\e[0m\n" 'Pre-Commit'

# Undo the stash of the files
pop_stash_files () {
    if [ -n "$hasChanges" ]; then
        printf "\e[33;1m%s\e[0m\n" '=== Applying git stash changes ==='
        git stash pop
    fi
}

#
# Stash unstaged files
#
hasChanges=$(git diff)
if [ -n "$hasChanges" ]; then
    printf "\e[33;1m%s\e[0m\n" 'Stashing unstaged changes'
    git stash push --keep-index
fi

printf "\e[33;1m%s\e[0m\n" '=== Running Pub get ==='
flutter pub get
printf "\e[33;1m%s\e[0m\n" 'Finished Running Pub get'

#
# Easy Localization
#
printf "\e[33;1m%s\e[0m\n" '=== Running Easy Localization ==='
flutter pub run easy_localization:generate -S assets/locales -O lib/src/i18n
flutter pub run easy_localization:generate -S assets/locales -f keys -O lib/src/i18n/ -o locale_keys.g.dart

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf "\e[33;1m%s\e[0m\n" 'Generated locale files added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished Running Easy Localization'
printf '%s\n' "${avar}"

#
# Build Runner
#
printf "\e[33;1m%s\e[0m\n" '=== Running Build Runner ==='
flutter pub run build_runner build --delete-conflicting-outputs

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf "\e[33;1m%s\e[0m\n" 'Generated locale files added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished Running Build Runner'
printf '%s\n' "${avar}"

#
# Flutter formatter
#
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter Formatter ==='
dart format .

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf "\e[33;1m%s\e[0m\n" 'Formmated files added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter Formatter'
printf '%s\n' "${avar}"

#
# Dart Fix
#
printf "\e[33;1m%s\e[0m\n" '=== Running Dart Fix ==='
dart fix --apply

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf "\e[33;1m%s\e[0m\n" 'Fixed files added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Dart Fix'
printf '%s\n' "${avar}"

#
# Flutter Analyzer
#
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter analyzer ==='
flutter analyze
if [ $? -ne 0 ]; then
  printf "\e[31;1m%s\e[0m\n" '=== Flutter analyzer error ==='
  pop_stash_files
  exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter analyzer'
printf '%s\n' "${avar}"


# Unit tests
# printf "\e[33;1m%s\e[0m\n" '=== Running Unit Tests ==='
# flutter test
# if [ $? -ne 0 ]; then
#   printf "\e[31;1m%s\e[0m\n" '=== Unit tests error ==='
#   pop_stash_files
#   exit 1
# fi
# printf "\e[33;1m%s\e[0m\n" 'Finished running Unit Tests'
# printf '%s\n' "${avar}"

pop_stash_files