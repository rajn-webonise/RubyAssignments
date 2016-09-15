class TranscationAPI

#  attr_accessor :id, :product_name, :buyer_name, :timestamp, :amount_paid

  attr_reader :list

  @@current_id = 0

  def self.record(p_name, b_name, timestamp, amount)
    @list ||= Array.new
    @list.push({id: @@current_id, product_name: p_name, buyer_name: b_name, timestamp: timestamp, amount_paid: amount })
    @@current_id += 1
  end


end
