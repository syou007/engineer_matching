class RoutesReloader
  def initialize(app)
    @app = app
    routes_path = Dir.glob("config/routes/*.rb")
    @routes_reloader = ActiveSupport::FileUpdateChecker.new(routes_path) do
      Rails.application.reload_routes!
    end
  end

  def call(env)
    @routes_reloader.execute_if_updated
    @app.call(env)
  end
end

Rails.application.config.middleware.use RoutesReloader if Rails.env.development?