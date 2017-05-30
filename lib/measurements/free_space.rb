module Sermon
  class FreeSpace
    include BaseMeasure
    attr_reader :errors

    def initialize(files_hash)
      @files_hash = files_hash
      @errors = []
    end

    def perform_measurement
      @files_hash.each do |file, size|
        file_size = `du -cshm #{file}`.split("\t").first.to_i
        @errors << Messages.free_space_error(file, file_size, size) if size < file_size
      end
    end
  end
end
