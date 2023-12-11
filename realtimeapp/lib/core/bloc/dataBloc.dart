import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:realtimeapp/core/bloc/dataEvent.dart';
import 'package:realtimeapp/core/bloc/dataState.dart';
import 'package:realtimeapp/core/model/data.dart';

import '../service/websocketService.dart';

class DataBloc extends Bloc<DataEvent,DataState>{
  RealtimeDataService service;
  late StreamController<Map> _streamController;
  DataBloc({required this.service}):super(DataInitialState()){
      on<DataConnectEvent>(_start);
      on<UpdateDataEvent>(_update);

      _streamController = StreamController();
  }

  void _start(event,emit){

    service.start(_streamController);
    _streamController.stream.listen((data)async {
      add(UpdateDataEvent(data: data));
    });

  }
  void _update(event,emit){
    emit(DataPresentState(data: RealtimeDataModel.fromMap(event.data)));
  }
}