module Jekyll
  module Filters

    # Remove all links <a href="...">...</a>
    def strip_links(input)
      empty = ''.freeze
      input.to_s.gsub(/<a.*?>/m, empty).gsub(/<\/a>/m, empty)
    end

    # Remove <sup id="fnref:...">...</sup> and <div class="footnotes">...</div>
    def strip_footnotes(input)
      empty = ''.freeze
      input.to_s.gsub(/ *<sup.*?<\/sup>/m, empty).gsub(/<div class="footnotes".*?<\/div>/m, empty)
    end
  end
end
