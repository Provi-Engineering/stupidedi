# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        SAC = s::SegmentDef.build(:SAC, "Service, Promotion, Allowance, or Charge Information",
          "To request or identify a service, promotion, allowance, or change for the service
           specified",
          e::E248 .simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E1300.simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E610 .simple_use(r::Mandatory, s::RepeatCount.bounded(1)),
          e::E118 .simple_use(r::Optional,  s::RepeatCount.bounded(1)),
          e::E352 .simple_use(r::Mandatory, s::RepeatCount.bounded(1)))
      end
    end
  end
end
