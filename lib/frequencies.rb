class Frequencies
  def initialize(raw)
    @table = {}
    
    raw.each_line do |line|
      frequency = line.split(' ')[0].to_i
      pattern   = line.split(' ')[1..-1].join(' ')
      
      @table[pattern] = frequency
    end
    
    @total = @table.values.inject(0) {|sum, element| sum += element }
  end
  
  def each &iterator
    @table.each &iterator
  end

  def probability_of(pattern)
    frequency_of(pattern) / @total
  end
  
private  
  def frequency_of(pattern)
    @table[pattern].to_f
  end
end