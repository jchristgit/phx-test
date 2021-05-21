defmodule DbcWeb.CacheBodyReader do
  # via https://github.com/phoenixframework/phoenix/issues/459#issuecomment-440820663
  def read_body(conn, opts) do
    # REVIEW: merge with "length: 0"
    {:ok, body, conn} = Plug.Conn.read_body(conn, opts)
    body = body || conn.private[:raw_body]
    conn = Plug.Conn.put_private(conn, :raw_body, body)
    {:ok, body, conn}
  end

  def read_cached_body(conn) do
    conn.private[:raw_body]
  end
end
