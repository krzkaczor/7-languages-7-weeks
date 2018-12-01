array = Array (1..16)

array.each_slice(4) { | slice | puts slice.join " " }