module GitCommitSizeScraper
  class Scraper
    attr_reader :commits, :list

    def initialize *args
      args.flatten!
      @commits = `git rev-list --all #{args.join " "}`.split
      @list    = {}
    end

    def blobs_in_commit treeish
     `git diff-tree -r -c -M -C --no-commit-id #{treeish}`.
       split("\n").
       map { |blob| blob.split[3] }
    end

    def size_in_bytes obj
      return 0 if obj =~ /\A0+\z/
      `git cat-file -s #{obj}`.to_i
    end

    def bytes_in_commit treeish
      blobs = blobs_in_commit treeish
      total = blobs.map { |blob| size_in_bytes blob }.reduce(:+)
    end

    def walk
      @commits.map { |c| @list[c] = bytes_in_commit c }
    end
  end
end
