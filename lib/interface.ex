defmodule Interface.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run Interface.User.Server
end

defmodule Interface.User.Server do
  use GRPC.Server, service: Interface.User.Service

  def create(request, _stream) do
    new_user =
      UserDB.add_user(%{
        first_name: request.first_name,
        last_name: request.last_name,
        age: request.age
      })

    Interface.UserReply.new(new_user)
  end

  def get(request, _stream) do
    user = UserDB.get_user(request.id)

    if user === nil do
      raise GRPC.RPCError, status: :not_found
    else
        Interface.UserReply.new(user)
    end
  end
end
