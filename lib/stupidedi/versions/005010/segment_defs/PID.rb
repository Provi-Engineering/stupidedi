# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        PID = s::SegmentDef.build(:PID, "Product/Item Description",
          "To describe a product or process in coded or free-form format",
          e::E349 .simple_use(r::Mandatory,  s::RepeatCount.bounded(1)),
          e::E750 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E559 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E751 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E352 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E752 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E822 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E1073.simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E819 .simple_use(r::Optional,   s::RepeatCount.bounded(1)))
      end
    end
  end
end
