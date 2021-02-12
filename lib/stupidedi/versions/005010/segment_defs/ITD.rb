# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        ITD = s::SegmentDef.build(:ITD, "Terms of Sale",
          "To specify terms of sale",
          e::E336 .simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E333 .simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E338 .simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E370 .simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E351 .simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E446 .simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E342 .simple_use(r::Relational,  s::RepeatCount.bounded(1)))
      end
    end
  end
end
