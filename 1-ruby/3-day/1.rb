module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module LookLikeJSON
    def method_missing(meth, *args, &block)
      if has_key?(meth.to_s)
        self[meth.to_s]
      else
        raise NoMethodError, 'undefined method #{meth} for #{self}' 
      end
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each (&block)
      @csv_contents.each do |rowValues|
        row = Hash[@headers.zip(rowValues)]
        row.extend(LookLikeJSON)
        block.call(row)
      end
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each {|row| puts row}
m.each {|row| puts row.one}