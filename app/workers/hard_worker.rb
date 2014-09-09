class HardWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :carrierwave

  def perform(name, count)
    puts "Doing carrierwave work"
  end
end
