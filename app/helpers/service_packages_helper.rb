module ServicePackagesHelper
  def service_package_options
    ServicePackage.all.map { |sp| [sp.name, sp.id, { data: { name: sp.name, cost: sp.price } }] }
  end
end
