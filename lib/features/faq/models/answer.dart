import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'answer.freezed.dart';

part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    required String title,
    required String text,
    String? de_title,
    String? de_text,
    String? pl_title,
    String? pl_text,
    String? fr_title,
    String? fr_text,
    String? ru_title,
    String? ru_text,
    String? uk_title,
    String? uk_text,
  }) = _Answer;

  factory Answer.fromJson(Map<String, Object?> json) => _$AnswerFromJson(json);
}
