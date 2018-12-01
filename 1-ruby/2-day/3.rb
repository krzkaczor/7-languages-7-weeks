def grep(file_path, pattern) 
  IO.foreach(file_path) do |line|
    puts line if line.include? pattern
  end
end

grep __FILE__,  "puts" # run on the source code itself xD