num_to_words.rb

module InWords
    # creates an array with text string elements and assigns to a variable
    SMALL_NUMBERS = %w{zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}
    # creates an array with text string elements and assigns to a variable
    TENS = %w{zero ten twenty thirty forty fifty sixty seventy eighty ninety}
    
    # defines the in_words method
    def in_words
        # convert object to string to easily grab digits
        self_string = self.to_s
        # for the digits that don't exist they will be nil
        # nil.to_i = 0
        
        # look up 3rd digit from end of string, convert to integer, and assign to variable
        h = self_string[-3].to_i
        # look up 2nd digit from end of string, convert to integer, and assign to variable
        t = self_string[-2].to_i
        # seriously?
        o = self_string[-1].to_i
        
        # initializes an empty array and assigns to variable "words"
        words = []
        
        # converts hundreds digit to int (WHY 2ND TIME?), looks up corresponding value in SMALL_NUM array, adds "hundred" to string, and pushes to WORDS array
        words << SMALL_NUMBERS[h.to_i] + " hundred" if h != 0
        
        # teens
        if t == 1
            words << SMALL_NUMBERS[self_string[-2..-1].to_i]
            # non-teen
            else
            words << TENS[t] if t != 0
            words << SMALL_NUMBERS[o.to_i] if o != 0
        end
        
        # concatenates all the elements in the words array
        words.join(" ")
    end
end


#adds InWords module to the Fixnum class
class Fixnum
    include InWords
end