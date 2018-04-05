class OpenInvoice
  include ActiveModel::Model

  attr_accessor(
    :contact_name,
    :due_value
  )

  class << self
    def all(user)
      FreeagentClient.new(user).open_invoices.map do |obj|
        OpenInvoice.new(
          contact_name: obj['contact_name'],
          due_value: obj['due_value']
        )
      end
    end
  end
end
