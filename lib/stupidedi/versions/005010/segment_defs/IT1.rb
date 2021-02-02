# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        IT1 = s::SegmentDef.build(:IT1, "Baseline Item Data (Invoice)",
          "To specify the basic and most frequently use line item data
           for the invoice and related transactions",
          e::E350.simple_use(r::Optional,    s::RepeatCount.bounded(1)),
          e::E358.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E355.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E212.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E235.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E234.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E235.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E234.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E235.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E234.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E235.simple_use(r::Relational,  s::RepeatCount.bounded(1)),
          e::E234.simple_use(r::Relational,  s::RepeatCount.bounded(1)))
      end
    end
  end
end
