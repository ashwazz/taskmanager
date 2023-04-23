import 'package:get/get.dart';
import 'package:taskmanager/DB/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController{


  @override
  void onReady(){
    super.onReady();
  }
  Future<int>addTask({Task?  task})async{
    return await DBHelper.insert(task);
  }


}