module Enumerable
  def my_each
    if block_given?
        i = 0
      if self.is_a?(Hash)
        while(i < self.size )
          yield(keys[i], values[i])
          i += 1
        end #hashend
      else
      while( i < self.size)
        yield(self[i])
        i+=1;
      end
      self
    end
    else
to_enum(:my_each)
    end
  end

  def my_each_with_index
  if block_given?
    i = 0
    while (i < self.size)
      yield(self[i], i)
      i+=1;
    end
    self
  else
  to_enum(:my_each_with_index)
  end
end

  def my_select
  if block_given?
      returnArray = [];
      self.my_each do |item|
        if(yield(item))
          returnArray.push(item)
        end
      end #end myeach
       returnArray
      else
         to_enum(:my_select)
      end #end if
  end #end def

  def my_all?
      if block_given?
          self.each do |item|
             false if(yield(item) == false)
          end
          true
      else
        false
      end
  end

  def my_any?
    if block_given?
      for element in self
        return true if yield(element)
      end
      return false
    else
      to_enum(:my_any?)
    end
  end

  def my_none?
    if block_given?
      self.my_each  do |item|
      return  false if yield(item)
      end
     return  true
    else
      to_enum(:my_none?)
    end
  end

  def my_count
    if block_given?
      counter = 0
      self.my_each do |item|
        counter += 1 if yield(item)
      end
      counter
    else
      to_enum(:my_count)
    end
end

  def my_map (&proc)
    if block_given? || proc
      returnArray = Array.new
      self.my_each do |item|
        returnArray.push( proc ? proc.call(item) : yield(item))
      end
      returnArray
    else
      to_enum(:my_map)
    end
  end

  def my_inject
    if block_given?

      sum = self[0]
      i = 1
        while i < self.length
          sum = yield(sum, self[i])
          i+=1
        end
       return sum
    else
      to_enum(:my_inject)
    end
  end

end #end enumerable


def multiply_els array
result =  array.my_inject do |sum, item|
    sum * item
  end
  return result
end

a_proc = Proc.new{ |item| item ** 2}


my_array = [1,2,3,4,5,6,7,8,100]
#[1,2,3].my_each { |num| print "#{num}!\n" }
#[1,2,3].my_each_with_index { |num, index| print "value at index #{index}  is #{num}! \n" }
my_hash = {"Joe" => "male", "Jim" => "male", "Patty" => "female", "Orange" => "black"}
#[1,2,3].my_each { |num| print "#{num}!\n" }
#puts my_array.my_select{|item| item%2==0 }
#puts my_hash.my_select{|name, gender| gender == "male" }
my_hash.my_each{|item, val | puts "#{item} is the new #{val}"}
#puts %w{ant bear cat}.my_all?{|word| word.length >= 3}
#puts %w{ant bear cat}.all? {|word| word.length >= 4}   #=> false
#puts my_array.my_any? { |item| item > 2}
#puts my_array.my_any? { |item| item > 2}
#puts my_array.my_none? { |item| item > 2}
#puts my_array.my_count { |item| item > 2}
#puts my_array.my_map { |item| item ** 2}

#puts my_array.my_inject { |sum, item|  sum * item }
#puts multiply_els my_array
#puts my_array.my_map(&a_proc)
