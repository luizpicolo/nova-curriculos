class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "Doing carrierwave work"
  end
end
