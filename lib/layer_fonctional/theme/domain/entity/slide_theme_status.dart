import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'theme_color_parser.dart';

part 'slide_theme_status.g.dart';

@CopyWith()
@JsonSerializable()
class SlideThemeStatus {
  final String todo;
  final String done;
  final String failed;
  final String blocked;

  const SlideThemeStatus({
    required this.todo,
    required this.done,
    required this.failed,
    required this.blocked,
  });

  const SlideThemeStatus.defaults()
    : todo = '#111111',
      done = '#16A34A',
      failed = '#DC2626',
      blocked = '#9CA3AF';

  Color get todoColor => parseThemeHex(todo);
  Color get doneColor => parseThemeHex(done);
  Color get failedColor => parseThemeHex(failed);
  Color get blockedColor => parseThemeHex(blocked);

  factory SlideThemeStatus.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeStatusToJson(this);
}
