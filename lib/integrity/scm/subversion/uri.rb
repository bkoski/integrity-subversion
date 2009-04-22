module Integrity
  module SCM

    class Subversion

      class URI
        def initialize(uri_string)
          @uri = Addressable::URI.parse(uri_string)
        end

        def working_tree_path
          path.gsub("/", "-")
        end

        private
        def path
          path = @uri.path
          path.gsub(/\~[a-zA-Z0-9]*\//, "").gsub(/^\//, "")
        end
      end
    end
  end
end
