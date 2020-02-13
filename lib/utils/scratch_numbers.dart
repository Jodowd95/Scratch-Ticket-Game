import 'random_number_generator.dart';

payoutGenerator(){
  var num =randomMoneyGenerator();
  if (num <= 5000 ){
    return 1;
  } else if (num <= 7000 && num >= 5001){
    return 2;
  } else if (num <= 8500 && num >= 7001){
    return 5;
  } else if (num <= 9200 && num >= 8501){
    return 10;
  } else if (num <= 9800&& num >= 9201){
    return 20;
  } else if (num <= 9900 && num >= 9801){
    return 50;
  } else if (num <= 9990 && num >= 9901){
    return 100;
  } else if (num <= 9999 && num >= 9991){
    return 1000;
  } else if (num ==10000){
    return 100000;
  }
}