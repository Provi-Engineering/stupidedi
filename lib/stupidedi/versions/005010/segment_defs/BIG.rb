# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        BIG = s::SegmentDef.build(:BIG, "Beginning Segment for Invoice",
          "To indicate the beginning of an invoice transaction set and
           transmit identifying numbers and dates",
          e::E373.simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E76 .simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E373.simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E324.simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E640.simple_use(r::Optional,  s::RepeatCount.bounded(1)))
      end
    end
  end
end
