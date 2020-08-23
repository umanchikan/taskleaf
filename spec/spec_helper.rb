RSpec.configure do |config|
  # 「headless_chromeのno-sandboxオプション」を追加する
  config.before(:each) do |example|
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: { args: ['no-sandbox'] } if example.metadata[:type] == :system
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
