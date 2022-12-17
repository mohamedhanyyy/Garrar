import 'package:bloc/bloc.dart';
import 'package:garrar/features/my_orders/cubit/my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitial());
}
