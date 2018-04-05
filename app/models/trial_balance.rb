class TrialBalance
  include ActiveModel::Model

  attr_accessor(
    :corporation_tax_owed,
    :vat_owed,
    :salaries_owed,
    :expenses_owed
  )

  class << self
    def find(_user)
      TrialBalance.new(
        vat_owed: -1,
        corporation_tax_owed: -2,
        salaries_owed: [
          OpenStruct.new(name: 'Toby', total: -123)
        ],
        expenses_owed: [
          OpenStruct.new(name: 'Fred', total: -456)
        ]
      )
    end
  end
end
