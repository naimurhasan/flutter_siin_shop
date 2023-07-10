part of helper_functions;

void dPrint(String? message, { int? wrapWidth }){
  if(kDebugMode){
    debugPrint(message,wrapWidth: wrapWidth);
  }
}