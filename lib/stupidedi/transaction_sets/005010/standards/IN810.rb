# frozen_string_literal: true
module Stupidedi
  module TransactionSets
    module FiftyTen
      module Standards
        b = Builder
        d = Schema
        r = SegmentReqs
        s = SegmentDefs

        IN810 = b.build("IN", "810", "Invoice",
          d::TableDef.header("1 - Heading",
            s:: ST.use(100, r::Mandatory, d::RepeatCount.bounded(1)),
            s::BIG.use(200, r::Mandatory, d::RepeatCount.bounded(1)),

            d::LoopDef.build("N1", d::RepeatCount.bounded(200),
              s:: N1.use(700,  r::Mandatory,  d::RepeatCount.bounded(1)),
              s:: N2.use(800,  r::Optional,   d::RepeatCount.bounded(1)),
              s:: N3.use(900,  r::Optional,   d::RepeatCount.bounded(1)),
              s:: N4.use(1000, r::Optional,   d::RepeatCount.bounded(1)))),

          d::TableDef.header("2 - Detail",
            d::LoopDef.build("IT1", d::RepeatCount.bounded(200000),

              s::IT1.use(100,  r::Mandatory, d::RepeatCount.bounded(1)),

              s::PID.use(600, r::Mandatory, d::RepeatCount.bounded(1)),

              s::PO4.use(1000, r::Optional, d::RepeatCount.bounded(1)),

              d::LoopDef.build("SAC", d::RepeatCount.bounded(9999),
                s::SAC.use(1800, r::Mandatory, d::RepeatCount.bounded(1))))),

          d::TableDef.header("3 - Summary",
            s::TDS.use(100, r::Mandatory, d::RepeatCount.bounded(1)),

            d::LoopDef.build("SAC", d::RepeatCount.unbounded,
              s::SAC.use(400,  r::Mandatory, d::RepeatCount.bounded(1))),

            d::LoopDef.build("ISS", d::RepeatCount.unbounded,
              s::ISS.use(400,  r::Mandatory, d::RepeatCount.bounded(1))),

            s:: SE.use(800, r::Mandatory, d::RepeatCount.bounded(1))))
      end
    end
  end
end
