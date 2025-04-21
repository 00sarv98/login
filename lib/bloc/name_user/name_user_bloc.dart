import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_user_event.dart';
part 'name_user_state.dart';

class NameUserBloc extends Bloc<NameUserEvent, NameUserState> {
  NameUserBloc() : super(NameUserInitial("")) {
    on<TextChanged>((event, emit) {
      emit(NameUserInitial(event.newText));
    });
  }
}
