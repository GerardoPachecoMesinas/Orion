class Ticket < ApplicationRecord
  belongs_to :client

  state_machine initial: :open do
    state :open
    state :in_progress
    state :resolved
    state :reopened
    state :closed
    state :canceled_by_customer
    state :canceled_by_provider
    state :unresolved

    event :start_work do
      transition [:open, :reopened] => :in_progress
    end

    event :resolve do
      transition in_progress: :resolved
    end

    event :close do
      transition resolved: :closed
    end

    event :cancel_by_customer do
      transition open: :canceled_by_customer
      transition reopened: :resolved
    end

    event :cancel_by_provider do
      transition open: :canceled_by_provider
      transition reopened: :resolved
    end

    event :reopen do
      transition resolved: :reopened
    end

    event :mark_unresolved do
      transition in_progress: :unresolved
    end
  end
end
