import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebek_vpn/features/faq/data/faq_repository.dart';

import '../models/models.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit({required this.faqRepository}) : super(FaqUnloaded());

  final FaqRepository faqRepository;

  Future<List<Answer>> loadFaq() async {
    if (state is FaqLoaded) {
      return (state as FaqLoaded).answers;
    } else {
      List<Answer> answers = await faqRepository.loadFaq();
      emit(FaqLoaded(answers: answers));
      return answers;
    }
  }
}
