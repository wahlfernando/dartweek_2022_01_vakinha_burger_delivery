
import 'package:intl/intl.dart';

class FormaterHelper {
  
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: r'R$',
  );


  FormaterHelper._();

  static String formatCurrency(double value ){
    return _currencyFormat.format(value);
  }


}