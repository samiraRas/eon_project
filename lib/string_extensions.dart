extension StringExtensions on String{
 bool  isValidEmail(){
   return RegExp(r"^[0-9]{1,2}?:[0-9]{0,2}").hasMatch(this);
 }
 bool isWhitespcae() => trim().isEmpty;
 bool isValidDouble() => double.tryParse(this)!=null;
 bool isValidInt() => int.tryParse(this)!=null;

}