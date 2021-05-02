
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/models/dummy_data.dart';

class CarsRepo {
  void  addCar(Car   car){
    DUMMY_DATA.add(car);


  }

  void  editCar(Car car ,int index){
    DUMMY_DATA.replaceRange(index, index+1, [car]);

  }

  void deleteCar(int id ){
    DUMMY_DATA.removeWhere((element) => element.id == id);

  }
}