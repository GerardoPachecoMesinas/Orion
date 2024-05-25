# rails service_package:cancel
namespace :service_package do
  desc "This task cancels the service when the current invoice has not been paid"

  task(cancel: :environment) do
    puts "Cancel is running"
    puts "Clientes: #{Client.all.count}"
  end
end
