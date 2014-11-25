require 'cgi'

module Precious
  module Views
    class Layout < Mustache
      include Rack::Utils
      alias_method :h, :escape_html

      attr_reader :name, :path

      def escaped_name
        CGI.escape(@name)
      end

      def title
        "Home"
      end

      def has_path
        !@path.nil?
      end

      def base_url
        @base_url
      end

      def css # custom css
        @css
      end

      def js # custom js
        @js
      end

      def author_name_email
        if @author_parameters.nil?
          @default_author_name
        else
          @author_parameters[:name] + ' <' + @author_parameters[:email] + '>'
        end
      end

    end
  end
end
