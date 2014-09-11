PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
     :encoding=>"UTF-8",
     :page_size=>"Ledger",
     :zoom => '1.3',
     :disable_smart_shrinking=>false
  }

  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000"
  config.verbose = false
end
