# frozen_string_literal: true
module Stupidedi
  module TransactionSets
    module FiftyTen
      module Implementations
        b = Builder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = SegmentDefs

        IN810 = b.build("IN", "810", "Invoice",
          d::TableDef.header("Heading",
            b::Segment(100, s:: ST, "Transaction Set Header", r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("810")),
              b::Element(e::Required,    "Transaction Set Control Number"),
              b::Element(e::Situational, "Unused")),

            b::Segment(200, s::BIG, "Beginning Segment for Invoice", r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Date"),
              b::Element(e::Required,    "Invoice Number"),
              b::Element(e::Required,    "Date"),
              b::Element(e::Required,    "Purchase Order Number"),
              b::Element(e::Situational, "Transaction Type Code")),

            d::LoopDef.build("N1", d::RepeatCount.bounded(200),
              b::Segment(700,  s:: N1, "Party Identification", r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Entity Identifier Code"),
                b::Element(e::Required, "Name"),
                b::Element(e::Required, "Identification Code Qualifier"),
                b::Element(e::Required, "Identification Code")),

              b::Segment(800,  s:: N2, "Additional Name Identification", r::Optional, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Name"),
                b::Element(e::Optional, "Name")),

              b::Segment(900,  s:: N3, "Party Location", r::Optional, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Address Information"),
                b::Element(e::Optional, "Address Information")),

              b::Segment(1000, s:: N4, "Geographic Location", r::Optional, d::RepeatCount.bounded(1),
                b::Element(e::Optional, "City Name"),
                b::Element(e::Optional, "State or Province Code"),
                b::Element(e::Optional, "Postal Code"),
                b::Element(e::Optional, "Country Code"),
                b::Element(e::Optional, "Location Qualifier"),
                b::Element(e::Optional, "Location Identifier"),
                b::Element(e::Optional, "Country Subdivision Code"))),

            b::Segment(130, s::ITD, "Invoice Term Date", r::Optional, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Due Date"))),

          d::TableDef.header("Detail",
            d::LoopDef.build("IT1", d::RepeatCount.bounded(200000),
              b::Segment(100, s::IT1, "Baseline Item Data", r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Situational, "Line Item Count"),
                b::Element(e::Required,    "Quantity Invoiced"),
                b::Element(e::Required,    "Unit or Basis for Measurement"),
                b::Element(e::Required,    "Unit Price"),

                b::Element(e::Situational, "Product/Service ID Qualifier"),
                b::Element(e::Situational, "Product/Service ID"),

                b::Element(e::Situational, "Product/Service ID Qualifier"),
                b::Element(e::Situational, "Product/Service ID"),

                b::Element(e::Situational, "Product/Service ID Qualifier"),
                b::Element(e::Situational, "Product/Service ID"),

                b::Element(e::Situational, "Product/Service ID Qualifier"),
                b::Element(e::Situational, "Product/Service ID")),

              d::LoopDef.build("PID", d::RepeatCount.unbounded,
                b::Segment(600, s::PID, "Product Item Description", r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "Item Description Type"),
                  b::Element(e::Situational, "Product/Process Characteristic Code"),
                  b::Element(e::Situational, "Agency Qualifier Code"),
                  b::Element(e::Situational, "Product Description Code"),
                  b::Element(e::Situational, "Description"),
                  b::Element(e::Situational, "Surface/Layer/Position Code"),
                  b::Element(e::Situational, "Source Subqualifier"),
                  b::Element(e::Situational, "Yes/No Condition or Response Code"),
                  b::Element(e::Situational, "Language Code"))),

              b::Segment(1000, s::P04, "Item Physical Details", r::Situational, d::RepeatCount.bounded(1),
                # Number of Units in Package
                b::Element(e::Situational, "Pack")),

              d::LoopDef.build("SAC", d::RepeatCount.unbounded,
                b::Segment(1800, s::SAC, "Service, Promotion, Allowance, or Charge Information", r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Allowance or Charge Indicator"),
                  b::Element(e::Required,    "Service, Promotion, Allowance, or Charge Code"),
                  b::Element(e::Required,    "Extended Price"),
                  b::Element(e::Situational, "Allowance or Charge Rate per Unit"),
                  b::Element(e::Required,    "Adjustment Name"))))),

          d::TableDef.header("Summary",
            b::Segment(100, s::TDS, "Total Monetary Value Summary", r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required, "Total")),

            d::LoopDef.build("SAC", d::RepeatCount.unbounded,
              b::Segment(400, s::SAC, "Service, Promotion, Allowance, or Charge Information", r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Allowance or Charge Indicator"),
                b::Element(e::Required,    "Service, Promotion, Allowance, or Charge Code"),
                b::Element(e::Required,    "Extended Price"),
                b::Element(e::Required,    "Adjustment Name"))),

            d::LoopDef.build("ISS", d::RepeatCount.unbounded,
              b::Segment(400, s::ISS, "Invoice Shipment Summary", r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Situational,    "Number of Units Shipped"),
                b::Element(e::Situational,    "Unit or Basis for Measurement Code"),
                b::Element(e::Situational,    "Weight"),

                b::Element(e::Situational,    "Unit or Basis for Measurement Code"),
                b::Element(e::Situational,    "Volumne"),

                b::Element(e::Situational,    "Unit or Basis for Measurement Code"),
                b::Element(e::Situational,    "Quantity"),
                b::Element(e::Situational,    "Weight"))),

            b::Segment(800, s::SE, "Transaction Set Trailer", r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Number of Included Segments"),
              b::Element(e::Required,    "Transaction Set Control Number"))))
      end
    end
  end
end
