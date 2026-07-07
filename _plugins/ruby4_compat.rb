# frozen_string_literal: true
# Ruby 3.2+ removed Object#tainted? and #untaint. Liquid 4.0.3 still calls them.
# Stub both back as no-ops so Liquid renders correctly on Ruby 4.0.
class Object
  def tainted?
    false
  end

  def untaint
    self
  end
end
