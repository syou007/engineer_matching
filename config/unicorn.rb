rails_root = File.expand_path('../../', __FILE__)
rails_env = ENV['RAILS_ENV'] || "development"

worker_processes rails_env == "production" ? 10 : 2
working_directory rails_root
timeout 200

ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"

stderr_path File.expand_path('../../log/unicorn_stderr.log', __FILE__)
stdout_path File.expand_path('../../log/unicorn_stdout.log', __FILE__)

listen File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)
pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

preload_app true
# GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

# USR2シグナルを受けると古いプロセスを止める。
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end