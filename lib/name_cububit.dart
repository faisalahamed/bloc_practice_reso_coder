import 'package:bloc/bloc.dart';
import 'package:bloc_learing/constant.dart';
import 'random_name.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null); //super('Foo')

  void pickRandomName() => emit(nameList.getRandomElement());

}
