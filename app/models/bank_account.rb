class BankAccount
  include ActiveModel::Model

  attr_accessor(
    :name,
    :current_balance
  )
end
