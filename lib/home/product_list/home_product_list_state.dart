abstract class DataCubitState {
  const DataCubitState();
}

class SuccessState extends DataCubitState {
  const SuccessState();
}

class ErrorState extends DataCubitState {
  final String message;
  const ErrorState(this.message);
}

class LoadingState extends DataCubitState {
  const LoadingState();
}