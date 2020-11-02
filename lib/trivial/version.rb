# frozen_string_literal: true

module Trivial
  module Version
    MAJOR = 4
    MINOR = 1
    PATCH = 0
    PRE   = nil

    VERSION = [MAJOR, MINOR, PATCH].compact.join(".")

    STRING = [VERSION, PRE].compact.join("-")
  end

  VERSION = Trivial::Version::STRING
end
