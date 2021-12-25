def DNA_strand(dna)
  hsh = [['A', 'T'], ['T', 'A'], ['G', 'C'], ['C', 'G']].to_h
  dna
    .chars
    .map { |char| hsh[char] if hsh.include?(char) }
    .join
end
