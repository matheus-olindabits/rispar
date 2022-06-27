// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProgressController on _ProgressControllerBase, Store {
  final _$stepActualAtom = Atom(name: '_ProgressControllerBase.stepActual');

  @override
  int get stepActual {
    _$stepActualAtom.reportRead();
    return super.stepActual;
  }

  @override
  set stepActual(int value) {
    _$stepActualAtom.reportWrite(value, super.stepActual, () {
      super.stepActual = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ProgressControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_ProgressControllerBaseActionController =
      ActionController(name: '_ProgressControllerBase');

  @override
  dynamic validateComeBack() {
    final $actionInfo = _$_ProgressControllerBaseActionController.startAction(
        name: '_ProgressControllerBase.validateComeBack');
    try {
      return super.validateComeBack();
    } finally {
      _$_ProgressControllerBaseActionController.endAction($actionInfo);
    }
  }

  @override
  dynamic changeStepActual(int value) {
    final $actionInfo = _$_ProgressControllerBaseActionController.startAction(
        name: '_ProgressControllerBase.changeStepActual');
    try {
      return super.changeStepActual(value);
    } finally {
      _$_ProgressControllerBaseActionController.endAction($actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stepActual: ${stepActual},
loading: ${loading}
    ''';
  }
}
