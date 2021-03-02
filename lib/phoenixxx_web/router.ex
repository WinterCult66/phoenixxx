defmodule PhoenixxxWeb.Router do
  use PhoenixxxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {PhoenixxxWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixxxWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/topics", TopicController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixxxWeb do
  #   pipe_through :api
  # end
end
