import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonNavIndexCubit extends Cubit<int> {
  ButtonNavIndexCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
