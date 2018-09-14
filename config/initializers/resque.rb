Resque.redis = "#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}"
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
