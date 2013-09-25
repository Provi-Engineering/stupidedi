module Stupidedi
  module Contrib
    module TwoThousandOne
      module Guides

        b = GuideBuilder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = Versions::FunctionalGroups::TwoThousandOne::SegmentDefs
        # s = Versions::FunctionalGroups::FortyTen::SegmentDefs
        t = Contrib::TwoThousandOne::TransactionSetDefs
        #t = Contrib::FortyTen::TransactionSetDefs
        #
        # Ship Notice/Manifest
        #
        PO830 = b.build(t::PO830,
          d::TableDef.header("Heading",
            b::Segment(10, s:: ST, "Transaction Set Header",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("830")),
              b::Element(e::Required,    "Transaction Set Control Number")),
            b::Segment(20, s::BFR, "Beginning Segment for Planning Schedule",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Purpose Code", b::Values("00","04","05")),
              b::Element(e::Required,    "Release Number"),
              b::Element(e::Required,    "Schedule Type Qualifier", b::Values("DL")),
              b::Element(e::Required,    "Schedule Quantity Qualifier", b::Values("A")),
              b::Element(e::Required,    "Date - Horizon Start"),
              b::Element(e::Required,    "Date - Horizon End"),
              b::Element(e::Required,    "Date - Release Generation"),
              b::Element(e::Situational, "Contract Number - Nissan Facility ID", b::Values("CP","DP","SP")))),

          d::TableDef.detail("Detail",            
            d::LoopDef.build("N1", d::RepeatCount.bounded(1),              
              b::Segment(90, s:: N1, "Name - Supplier Code",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code", b::Values("SU")),
                b::Element(e::Situational, "Identification Code Qualifier", b::Values("92")),
                b::Element(e::Situational, "Identification Code - Supplier Code assigned by Nissan"))),               

            d::LoopDef.build("N1", d::RepeatCount.bounded(1),              
              b::Segment(90, s:: N1, "Name - Nissan Analyst",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code", b::Values("MI")),
                b::Element(e::Situational, "Identification Code Qualifier", b::Values("Nissan")),
                b::Element(e::NotUsed,     "N103")),
              b::Segment( 140, s::PER, "Administrative Communications Contact - Nissan Release Sr Analyst",   
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Contact Function Code", b::Values("OD")),               
                b::Element(e::Situational, "Name"),
                b::Element(e::Situational, "Communication Number Qualifier", b::Values("TE")),
                b::Element(e::Situational, "Communication Number"))),

            d::LoopDef.build("LIN", d::RepeatCount.bounded(10000),
              b::Segment( 300, s::LIN, "Item Identification",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::NotUsed,     "LIN01"),
                b::Element(e::Required,    "Product/Service ID Qualifier", b::Values("BP")),
                b::Element(e::Situational, "Product/Service ID - Part Number assigned by Nissan"),
                b::Element(e::Situational, "Product/Service ID Qualifier", b::Values("PO")),
                b::Element(e::Situational, "Product/Service ID - Purchase Order Number assigned By Nissan")),
              b::Segment( 310, s::UNT, "Unit of Measure",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Unit or Basis for Measurement Code", b::Values("EA"))),
              b::Segment( 330, s::J2X, "Item Description",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::NotUsed,     "J2X01"),
                b::Element(e::Situational, "Item Description Type", b::Values("F")),
                b::Element(e::Required, "Lading Liability Code - Nissan's Part Description")),
              b::Segment( 450, s::PER, "Administrative Communications Contact - Nissan Parts Order Analyst",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Contact Function Code", b::Values("EX")),
                b::Element(e::Situational, "Name"),
                b::Element(e::Situational, "Communication Number Qualifier", b::Values("TE")),
                b::Element(e::Situational, "Communication Number")),

              d::LoopDef.build("N1", d::RepeatCount.bounded(1),              
                b::Segment(510, s:: N1, "Name - Dock Location",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required, "Entity Identifier Code", b::Values("ST")),
                  b::Element(e::NotUsed,  "Name - Dock Location"),
                  b::Element(e::NotUsed,  "N103"))),

              d::LoopDef.build("SDP", d::RepeatCount.bounded(104),
                b::Segment( 580, s::SDP, "Ship/Delivery Pattern",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Ship/Delivery or Calendar Pattern Code", b::Values("B","Y")),
                  b::Element(e::Required,    "Ship/Delivery or Calendar Pattern Code", b::Values("F","Y"))),
                b::Segment( 590, s::FST, "Forecast Schedule",
                  r::Required, d::RepeatCount.bounded(104),
                  b::Element(e::Required,    "Quantity"),
                  b::Element(e::Required,    "Forecast Qualifier", b::Values("C","Z","D")),
                  b::Element(e::Required,    "Forecast Timing Qualifier", b::Values("D","F")),
                  b::Element(e::Required,    "Date"),
                  b::Element(e::Situational, "Date"),
                  b::Element(e::Situational, "Date/Time Qualifier", b::Values("002")),
                  b::Element(e::Situational, "Time"),
                  b::Element(e::Situational, "Reference Number Qualifier", b::Values("DO")),
                  b::Element(e::Situational, "Reference Number - RAN"))),

              b::Segment(610, s::ATH, "Resource Authorization",
                r::Situational, d::RepeatCount.bounded(2),
                b::Element(e::Required,    "Resource Authorization Code", b::Values("FI","MT")),
                b::Element(e::Situational, "Date - Authorization Through Date"),
                b::Element(e::Situational, "Quantity - Required"),
                b::Element(e::NotUsed,     "ATH04"),
                b::Element(e::Situational, "Date")),

              b::Segment(650, s::TD5, "Carrier Details (Routing Sequence/Transit Time)",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Routing Sequence Code", b::Values("B")),
                b::Element(e::Situational, "Transportation Method/Type Code", b::Values("M"))),

              b::Segment(680, s::MAN, "Marks and Numbers",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Marks and Numbers Qualifier", b::Values("PB")),
                b::Element(e::Required, "Marks and Numbers")))),

          d::TableDef.header("Summary",
            d::LoopDef.build("CTT", d::RepeatCount.bounded(1),
              b::Segment(690, s::CTT, "Transaction Totals",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Number of Line Items"),
                b::Element(e::NotUsed,  "CTT02"),
                b::Element(e::NotUsed,  "CTT03"),
                b::Element(e::NotUsed,  "CTT04"),
                b::Element(e::NotUsed,  "CTT05"),
                b::Element(e::NotUsed,  "CTT06"),
                b::Element(e::NotUsed,  "CTT07")),
              b::Segment(700, s:: SE, "Transaction Set Trailer",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Number of Included Segments"),
                b::Element(e::Required,    "Transaction Set Control Number")))))
      end
    end
  end
end
