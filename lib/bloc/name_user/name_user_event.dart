part of 'name_user_bloc.dart';

@immutable
sealed class NameUserEvent {}

class TextChanged extends NameUserEvent {
  final String newText;
  TextChanged(this.newText);
}
