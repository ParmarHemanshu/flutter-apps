part of 'list_view_cubit.dart';

@immutable
abstract class ListViewState {}

class ListViewInitial extends ListViewState {}

class ListViewLoading extends ListViewState{}

class ListViewLoaded extends ListViewState{

  final List<Data> bookDataList;

  ListViewLoaded(this.bookDataList);
}

class ListViewError extends ListViewState{
  final AlertDialog alertDialog;

  ListViewError(this.alertDialog);
}
