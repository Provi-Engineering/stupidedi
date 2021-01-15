# frozen_string_literal: true
module Stupidedi
  module Versions
    module FiftyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        RMR = s::SegmentDef.build(:RMR, "Remittance Advice Accounts Receivable Open Item Reference",
          "To specify the accounts receivable open item(s) to be included in the cash application and to convey the appropriate detail")
      end
    end
  end
end
