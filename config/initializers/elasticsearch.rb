config = {
  host: "#{ENV['TEST_CLUSTER_NETWORK_HOST']}:#{ENV['TEST_CLUSTER_PORT']}",
  retry_on_failure: true,
  transport_options: {
    request: { timeout: 250 }
  }
}

if File.exists?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
