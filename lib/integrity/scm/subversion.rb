require 'hpricot'
module Integrity
  module SCM
    class Subversion

      attr_reader :uri, :branch, :working_directory

      def self.working_tree_path(uri)
        Subversion::URI.new( uri ).working_tree_path
      end

      # check the uri and see if it is a subversion url
      # There is a lot that can be a subversion url
      def self.is_this_my_home?( location )
        uri = Addressable::URI.parse( location )
        %w[ svn+ssh svn http https file ].include?( uri.scheme )
      end

      def initialize(uri, branch, working_directory = nil)
        @uri = uri.to_s
        @branch = branch.to_s
        @working_directory = working_directory
      end

      def with_revision(revision)
        initial_checkout unless already_out?
        update_to(revision)
        yield
      end

      def name
        self.class.name.split("::").last
      end

      def head
        log "Getting the HEAD of '#{uri}'"
        xml = %x[ svn info --non-interactive --xml #{uri} ]
        doc = Hpricot::XML( xml )
        return doc.at("commit")['revision']
      end

      def info( revision )
        log "Retrieving info for revision #{revision}"
        xml = %x[  svn log --non-interactive --xml --revision #{revision} #{uri} ]
        doc = Hpricot::XML( xml )
        h = {}
        h['author']       = doc.at('author').inner_html + " <noemail>"
        h['message']      = doc.at('msg').inner_html
        h['committed_at'] = Time.parse(doc.at('date').inner_html).iso8601
        return h
      end


    private

      def initial_checkout
        log "Initial checkout of #{uri} to #{working_directory}"
        log_command("svn co -q #{uri} #{working_directory}" )
      end

      def update_to(revision=nil)
        log "Updating to revision #{revision}"
        log_command("cd #{working_directory} && svn up -q -r#{revision}" )
      end

      def log_command( cmd )
        output = %x[ #{cmd} ]
        if output.length > 0 then
          output.split("\n").each { |l| log l.strip }
        end
      end

      def already_out?
        File.directory?(working_directory / ".svn")
      end

      def log(message)
        Integrity.log(name) { message }
      end
    end
  end
end