// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$bannerFutureAtom =
      Atom(name: 'HomeStoreBase.bannerFuture', context: context);

  @override
  FutureStore<String> get bannerFuture {
    _$bannerFutureAtom.reportRead();
    return super.bannerFuture;
  }

  @override
  set bannerFuture(FutureStore<String> value) {
    _$bannerFutureAtom.reportWrite(value, super.bannerFuture, () {
      super.bannerFuture = value;
    });
  }

  late final _$getBannerHighlightAsyncAction =
      AsyncAction('HomeStoreBase.getBannerHighlight', context: context);

  @override
  Future<dynamic> getBannerHighlight() {
    return _$getBannerHighlightAsyncAction
        .run(() => super.getBannerHighlight());
  }

  @override
  String toString() {
    return '''
bannerFuture: ${bannerFuture}
    ''';
  }
}
