module InvoicesHelper
  def service_package_options
    ServicePackage.all.map do |service_package|
      [service_package.name,
       service_package.id,
       { data: { name: service_package.name, cost: service_package.price } }]
    end
  end
end
