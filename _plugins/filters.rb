module Jekyll
  module Filters

    # Remove <sup id="fnref:...">...</sup> and <div class="footnotes">...</div>
    def strip_footnotes(input)
      empty = ''.freeze
      input.to_s.gsub(/ *<sup.*?<\/sup>/m, empty).gsub(/<div class="footnotes".*?<\/div>/m, empty)
    end

    # Sort a hash using String#casecmp the case-insensitive version of String#<=>
    # By default, Enumerable#sort uses <=>
    # See Add sort_natural to jekyll/filters.rb https://github.com/jekyll/jekyll/issues/6290
    def sort_natural(input)
      input.sort { |apple, orange| apple.first.casecmp(orange.first) }

      # Other solution:
      #input.sort_by { |hash| hash.first.downcase }
    end

    def sort_tags_by_size(tags)
      tags.sort_by { |tag| tag.last.length }.reverse

      # Other solution:
      #tags.sort { |tag1, tag2| tag2.last.length <=> tag1.last.length }
    end

    def end_with_dots(input)
      text = input.to_s.dup

      text.gsub!(/\n/, ' ')
      text.strip!

      text.gsub!(/ :$/, '')
      text.gsub!(/\.\.\.$/, '')
      text.gsub!(/…$/, '')
      text.gsub!(/\.$/, '')

      text << '…'
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters)
