# Rails Sidekiq Template

Step 1 :

Make sure your Gemfile contain :


```Gemfile
 # Redis
 gem 'sidekiq'
```
 
Step 2 :

Add redis URL in config/initializers/sidekiq.rb :


```Gemfile
redis_conn = proc {
Redis.new # do anything you want here
}

Sidekiq.configure_server do |config|
	config.redis = { url: 'redis://localhost:6379/' }
end

Sidekiq.configure_client do |config|
	config.redis = { url: 'redis://localhost:6379/' }
end
```


Step 3 :

Add worker in app/workers/some_worker.rb 

```Ruby
class SomeWorker
	include Sidekiq::Worker
	def perform(name, count)
		puts name," ",count
	end
end
```

Name of class will effect to your worker name. For example SomeWorker is your worker name. Your worker filename will be some_worker.rb 


Step 4 :

Implement in your controller :


```Ruby
class WorkerController < ApplicationController
	def index
		SomeWorker.perform_async(params[:job],10)
	end
end
```
