# frozen_string_literal: true

require './lib/vehicle'

class Train < Vehicle # rubocop:todo Style/Documentation
  def pull_the_rope
    'Woo woooo!'
  end
end
