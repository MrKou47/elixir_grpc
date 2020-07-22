# ElixirGRPC

[Learn how to use gRPC in elixir.](https://blog.appsignal.com/2020/03/24/how-to-use-grpc-in-elixir.html)

## Usage

**Step0: Install grpc**
```sh
$ brew install protobuf
$ brew install grpcurl
```

**Step1: Install rebar3(protobuf-elixir require this tool)**

```sh
$ git clone https://github.com/erlang/rebar3.git
$ cd rebar3
$ ./bootstrap # that command will generate rebar3 in the current folder
$ pwd # ~/lib/rebar3
$ cp ./rebar3 /usr/local/bin 
```

**Step2: Initial project**

```sh
$ mix deps.get
$ mix local.rebar rebar3 /usr/local/bin/rebar3
```

**Step3: Start gRPC server**

```sh
$mix grpc.server # 15:52:00.838 [info] Running Interface.Endpoint with Cowboy using http://0.0.0.0:50051
```

**Step4: Open up another terminal, and send message**

```sh
$ grpcurl -plaintext -proto sample_app.proto -d '{"first_name": "Bob", "last_name": "Smith", "age": 40}' localhost:50051 sample_app.User.Create
{
  "id": 1,
  "firstName": "Bob",
  "lastName": "Smith",
  "age": 40
}

$ grpcurl -plaintext -proto sample_app.proto -d '{"id": 1}' localhost:50051 sample_app.User.Get
{
  "firstName": "Bob",
  "lastName": "Smith",
  "age": 40
}

$ grpcurl -plaintext -proto sample_app.proto -d '{"id": 2}' localhost:50051 sample_app.User.Get
ERROR:
  Code: NotFound
  Message: Some requested entity (e.g., file or directory) was not found
```
