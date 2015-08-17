class WorkerController < ApplicationController
  def index
     SomeWorker.perform_async(params[:job],10)
  end
end
