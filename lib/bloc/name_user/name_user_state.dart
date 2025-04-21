part of 'name_user_bloc.dart';

@immutable
sealed class NameUserState {
  final String text;
  NameUserState(this.text);
}

final class NameUserInitial extends NameUserState {
  NameUserInitial(super.text);
}
