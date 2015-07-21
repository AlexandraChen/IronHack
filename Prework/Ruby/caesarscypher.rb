class Caesar

    def initialize(shift)
        alphabet = (("A".."Z").to_a + ("a".."z").to_a).join
        @decrypt = alphabet
        @encrypt = alphabet[shift..-1] + alphabet[0...shift]
    end

    def encrypt(str)
      str.tr(@decrypt, @encrypt)
    end
    
    def decrypt(str)
      str.tr(@encrypt, @decrypt)
    end
end


cipher = Caesar.new(3)
cipher = cipher.encrypt("abc") #=> "def"
puts cipher

cipher2 = Caesar.new(-3)
cipher2 = cipher2.encrypt("ABC") #=> "xyz"
puts cipher2


=begin

tr(p1, p2) public
Returns a copy of str with the characters in from_str replaced by the corresponding characters in to_str. If to_str is shorter than from_str, it is padded with its last character in order to maintain the correspondence.

"hello".tr('el', 'ip')      #=> "hippo"
"hello".tr('aeiou', '*')    #=> "h*ll*"
Both strings may use the c1-c2 notation to denote ranges of characters, and from_str may start with a ^, which denotes all characters except those listed.

"hello".tr('a-y', 'b-z')    #=> "ifmmp"
"hello".tr('^aeiou', '*')   #=> "*e**o"

=end