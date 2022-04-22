class General<T>{
  T? data ;
  String? token ;
  bool error = false;
  bool haveNext = false;
  General({this.data,this.error = false,this.token,this.haveNext = false});
}