import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_state.dart';

class MarineOrderCubit extends Cubit<MarineOrderState> {
  MarineOrderCubit() : super(MarineOrderInitial());


}
