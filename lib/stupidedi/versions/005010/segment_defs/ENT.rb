# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        ENT = s::SegmentDef.build(:ENT, "Entity", "",
          e::E554.simple_use(r::Optional, s::RepeatCount.bounded(1)))
      end
    end
  end
end
