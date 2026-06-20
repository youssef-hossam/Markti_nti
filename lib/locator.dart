import 'package:get_it/get_it.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';

final getIt = GetIt.instance;


setupLocator(){

  getIt.registerLazySingleton( ()=> ApiConsumer() );




  
}