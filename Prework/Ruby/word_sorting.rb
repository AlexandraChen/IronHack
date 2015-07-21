def word_sorting(str)
	str = str.split.sort_by{|w| [w.downcase, w]}
	return str
end