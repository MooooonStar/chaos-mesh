rpc SetGolangError (GolangErrorRequest) returns (GolangErrorResponse) {}

message GolangErrorRequest{
  GolangErrorAction action = 1;
  string container_id = 2;
  //持续时间，换算成秒
  int64 duration = 3;
}
message GolangErrorResponse{
  //返回注入给了哪个进程
  uint32 pid = 1;
  //开始的时间
  int64 startTime = 2;
}

message GolangErrorAction{
  enum Action{
      SqlQueryErrorAction = 0;
  }
  Action action= 1;
}
