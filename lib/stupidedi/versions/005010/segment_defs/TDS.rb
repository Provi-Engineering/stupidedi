# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        TDS = s::SegmentDef.build(:TDS, "Total Monetary Value Summary",
          "To specify the total invoice discounts and amounts",
          e::E610.simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E610.simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E610.simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E610.simple_use(r::Optional,  s::RepeatCount.bounded(1)))
      end
    end
  end
end
