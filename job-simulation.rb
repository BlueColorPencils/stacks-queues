require './Stack.rb'
require './Queue.rb'

class Workers
  attr_reader :waiting, :workers
  def initialize
    @waiting = ten_peeps
    @workers = six_workers
  end

  def ten_peeps
    # starts the waiting list with 10 peoples
    waiting = Queue.new
    @waiting = (1..10).each do |num|
      waiting.enqueue("#{num}")
    end
    return waiting
  end

  def six_workers
    #starts the working list with 6 peoples
    workers = Stack.new
    @workers = 6.times do
      workers.push("#{@waiting.dequeue}")
    end
    return workers
  end

  def three_months
    rando = rand(1..6)
    rando.times do
      waiting.enqueue("#{workers.pop}")
    end

    rando.times do
      workers.push("#{waiting.dequeue}")
    end
  end
end
