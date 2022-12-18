abstract class MarineOrderState {}

class MarineOrderInitial extends MarineOrderState {}

class MarineOrderLoading extends MarineOrderState {}

class MarineOrderDone extends MarineOrderState {}

class MarineOrderError extends MarineOrderState {}
class MarineOrderImageChange extends MarineOrderState {}