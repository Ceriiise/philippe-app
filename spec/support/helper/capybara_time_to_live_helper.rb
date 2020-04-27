module CapybaraTimeToLiveHelper
  def wait_ttl
    sleep((ENV.fetch("CAPYBARA_TTL") { 5 }).to_i)
  end
end
