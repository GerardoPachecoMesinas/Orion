# rails service_package:renew_period
namespace :service_package do
  desc "this task renews invoices when the last invoice is finished"

  task(renew_period: :environment) do
    puts "I'm running the task"
    puts "Clientes: #{Client.all.count}"
  end
end
