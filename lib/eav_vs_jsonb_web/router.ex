defmodule EavVsJsonbWeb.Router do
  use EavVsJsonbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EavVsJsonbWeb do
    pipe_through :api
  end
end
