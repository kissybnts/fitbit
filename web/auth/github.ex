defmodule GitHub do
  use OAuth2.Strategy

  def new do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: "",
      client_secret: "",
      redirect_url: "http://localhost:4000/auth/callback"
      ])
  end

  def authorize_url!(params \\ []) do
    new()
    |> put_param(:scope, "user")
    |> OAuth2.Client.authorize_url!(params)
  end

  def get_token!(params \\ [], headers \\ [], options \\ []) do
    OAuth2.Client.get_token!(new(), params, headers, options)
  end

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
