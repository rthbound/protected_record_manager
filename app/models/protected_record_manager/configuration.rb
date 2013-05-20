module ProtectedRecordManager
  module Configuration
    def self.default_from=(string)
      @default_from = string
    end

    def self.default_from
      @default_from.nil? ? "no-reply@example.com" : @default_from
    end
  end
end
