import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_state.dart';

class DomesticOrderCubit extends Cubit<MarineOrderState> {
  DomesticOrderCubit() : super(MarineOrderInitial());

  List<String> locations = [
    'Cairo',
    'Giza',
    'Alexandra',
    'Marsa-Matrooh',
    'Al-Fayouum',
  ];

  String pickUpLocation = '';
  String dropOffLocation = '';
  String arrivalTime = '';
}
