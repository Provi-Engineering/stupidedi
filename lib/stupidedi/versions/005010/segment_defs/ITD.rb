# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        ITD = s::SegmentDef.build(:ITD, "Invoice Term Date",
          "To specify terms of sale",
          e::E446 .simple_use(r::Mandatory,  s::RepeatCount.bounded(1)))
      end
    end
  end
end
