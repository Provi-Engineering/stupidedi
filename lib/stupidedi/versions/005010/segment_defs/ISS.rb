# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        ISS = s::SegmentDef.build(:ISS, "Invoice Shipment Summary",
          "To specify summary details of total items shipped in
           terms of quantity, weight and volume",
          e::E382.simple_use(r::Optional, s::RepeatCount.bounded(1)),
          e::E355.simple_use(r::Optional, s::RepeatCount.bounded(1)),
          e::E81 .simple_use(r::Optional, s::RepeatCount.bounded(1)),

          e::E355.simple_use(r::Optional, s::RepeatCount.bounded(1)),
          e::E183.simple_use(r::Optional, s::RepeatCount.bounded(1)),

          e::E355.simple_use(r::Optional, s::RepeatCount.bounded(1)),
          e::E380.simple_use(r::Optional, s::RepeatCount.bounded(1)),
          e::E81 .simple_use(r::Optional, s::RepeatCount.bounded(1)))
      end
    end
  end
end
