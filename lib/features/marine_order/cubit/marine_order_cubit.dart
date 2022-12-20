import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_state.dart';
import 'package:image_picker/image_picker.dart';

class MarineOrderCubit extends Cubit<MarineOrderState> {
  MarineOrderCubit() : super(MarineOrderInitial());

  //common step variables

  List<String> data = [
    'cairo',
    'giza',
    'alex',
    'matroh',
    'fayoum',
  ];

  //first step screen
  int containerNumber = 0;
  String containerType = '';
  String shippingLine = '';
  String bookingNumber = '';
  XFile? bookingFirstFile;

  // second step screen

  String? shippingType;

  String? arrivalTime;

  String? customType;

  // third step screen

  String getOutLocation = '';

  String getInLocation = '';

  String destinationLocation = '';

  String dryPortLocation = '';
}
