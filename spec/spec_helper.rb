$:<< File.join(File.dirname(__FILE__),'..')

# Require regression testing code.
require 'lib/ole-regress.rb'

# Require shared contexts.
require 'spec/shared.rb'
Dir['spec/*/shared.rb'].sort.each {|file| require file}

RSpec.configure do |config|

  # Initiate a new OLE QA Framework Session before each spec.
  config.before(:all) do
    opts = OLE_QA::RegressionTest::Options
    @ole = OLE_QA::Framework::Session.new(opts)
  end

  config.after(:all) do
    # Close browser if OLE session is still active.
    #   (Prevents error messages from frozen or aborted sessions.)
    @ole.browser.close if @ole.class == OLE_QA::Framework::Session
  end

  config.after(:each) do
    if ! example.exception.nil? && @ole.class == OLE_QA::Framework::Session
      time     = "#{Time.now.strftime("%Y\-%m\-%d \- %I-%M-%S %p %Z")}"
      filename = "#{time} - #{example.full_description.to_s}.png"
      @ole.browser.screenshot.save('screenshots/' + filename)
    end
  end

end
