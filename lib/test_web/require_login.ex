defmodule TestWeb.RequireLogin do
  import Plug.Conn

  @behaviour Plug

  @impl Plug
  @spec init(Plug.opts()) :: Plug.opts()
  def init(opts), do: opts

  @impl Plug
  @spec call(Plug.Conn.t(), Plug.opts()) :: Plug.Conn.t()
  def call(conn, _opts) do
    # _uid = get_session(conn, :uid)
    conn
  end

end
