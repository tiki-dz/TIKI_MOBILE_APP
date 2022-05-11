class General<T>{
  T? data ;
  String? token ;
  bool error = false;
  bool haveNext = false;
  String errorMessage ="";
  General({this.data,this.error = false,this.token,this.haveNext = false, this.errorMessage =""});
}