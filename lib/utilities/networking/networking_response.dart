class NetworkingResponse {}

//jika terjadi masalah di networking, maka di handle oleh class ini
class NetworkingException extends NetworkingResponse {
  String message;
  NetworkingException(this.message);
}

class NetworkingSuccess extends NetworkingResponse {
  String body;
  int StatusCode;

  NetworkingSuccess(this.body, this.StatusCode);
}
