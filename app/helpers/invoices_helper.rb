module InvoicesHelper
  def service_package_options
    ServicePackage.all.map do |service_package|
      [
        service_package.name,
        service_package.id,
        { data: { name: service_package.name, cost: service_package.price } }
      ]
    end
  end

  def service_package_names
    Invoice.distinct.pluck(:service_package_name).compact
  end

  def payment_status_options
    Invoice.state_machine.states.map do |state|
      [I18n.t("activerecord.attributes.invoice.payment_statuses.#{ state.name }"), state.name]
    end
  end
end
