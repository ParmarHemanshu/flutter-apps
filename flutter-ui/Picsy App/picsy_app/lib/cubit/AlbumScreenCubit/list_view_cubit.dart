import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:picsy_app/models/AlbumModel.dart';

import 'package:picsy_app/repositories/AlbumRepository.dart';

part 'list_view_state.dart';

class ListViewCubit extends Cubit<ListViewState> {
  final AlbumRepository repository;
  ListViewCubit( this.repository) : super(ListViewInitial()){
    _getAlbumsFromRepo();
  }

  void _getAlbumsFromRepo() async{
    try{
      emit(ListViewLoading());
      final albumResponse=await repository.apiRequest.getResponse();
    List<BookData>? albumList= albumResponse.response!.bookData;
      emit(ListViewLoaded(albumList!));

    }catch(e){
    print(e.toString());
    }
  }




}
