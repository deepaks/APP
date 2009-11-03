module App
  module Custom
    module Labels
      def create_label_with(string_to_labelize)
        label = string_to_labelize.strip
        convert = Iconv.new('US-ASCII//TRANSLIT','UTF-8')
        label = convert.iconv(label)
        label = (label.gsub(/[^\w\s]/,'')).gsub(/\s+/,'_') 
        self.label = label.downcase
      end
    end

  end
end