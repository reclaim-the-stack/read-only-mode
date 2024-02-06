module ReadOnlyMode
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["REQUEST_METHOD"] == "GET" || env["REQUEST_METHOD"] == "HEAD"
        @app.call(env)
      else
        render_503(env)
      end
    rescue PG::ReadOnlySqlTransaction
      render_503(env)
    end

    private

    # 503 Service Unavailable with HTML or JSON depending on accept header
    def render_503(env)
      if env["HTTP_ACCEPT"] == "application/json"
        [503, { "content-type" => "application/json; charset=utf-8" }, [ReadOnlyMode.json_response]]
      else
        [503, { "content-type" => "text/html; charset=utf-8" }, [ReadOnlyMode.html_response]]
      end
    end
  end
end
