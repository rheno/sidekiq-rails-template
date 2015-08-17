redis_conn = proc {
  Redis.new # do anything you want here
}

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/' }
end

