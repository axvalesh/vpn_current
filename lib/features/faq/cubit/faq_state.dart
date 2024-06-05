part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqUnloaded extends FaqState {}

class FaqLoaded extends FaqState {
  final List<Answer> answers;

  FaqLoaded({required this.answers});
}
