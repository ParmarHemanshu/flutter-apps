part of 'list_view_cubit.dart';

@immutable
abstract class ListViewState {}

class ListViewInitial extends ListViewState {}

class ListViewLoading extends ListViewState{}

class ListViewLoaded extends ListViewState{

  final List<BookData> bookDataList;

  ListViewLoaded(this.bookDataList);
}
