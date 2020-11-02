# frozen_string_literal: true

module Trivial
  module Version
    MAJOR = 4
    MINOR = 0
    PATCH = 1
    PRE   = nil

    VERSION = [MAJOR, MINOR, PATCH].compact.join(".")

    STRING = [VERSION, PRE].compact.join("-")
  end

  VERSION = Trivial::Version::STRING
end
