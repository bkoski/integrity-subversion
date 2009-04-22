module Integrity
  module SCM
    class Git

      def self.is_this_my_home?( location )
        uri = Addressable::URI.parse( location )
        return (uri.scheme == "git" || uri.path =~ /\.git\/?/)
      end
    end
  end
end