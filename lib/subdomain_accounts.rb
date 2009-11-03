# Source From: 
#    http://www.robbyonrails.com/articles/2009/01/11/subdomain-accounts-with-ruby-on-rails-explained
# 
# Inspired by 
#   http://dev.rubyonrails.org/svn/rails/plugins/account_location/lib/account_location.rb
# 
module SubdomainAccounts
	def self.included( controller )
		controller.helper_method(:account_domain, :account_subdomain, :account_url, :current_account, :default_account_subdomain, :default_account_url)
	end

	protected

	# TODO: need to handle www as well
	def default_account_subdomain
		'www'
	end

	def account_url( account_subdomain = default_account_subdomain, use_ssl = request.ssl? )
		http_protocol(use_ssl) + account_host(account_subdomain)
	end

	def account_host( subdomain )
		account_host = ''
		account_host << subdomain + '.'
		account_host << account_domain
	end

	def account_domain
		account_domain = ''
		account_domain << request.domain + request.port_string
	end

	def account_subdomain
		@account_subdomain = request.subdomains.first || default_account_subdomain
		@account_subdomain
	end

	def default_account_url( use_ssl = request.ssl? )
		http_protocol(use_ssl) + account_domain
	end      

	def current_account
		@current_account = Account.domain_name_equals(account_subdomain).first || Account.domain_name_equals(default_account_subdomain).first

		if @current_account.nil?
			@current_account = Account.new
			@current_account.domain_name = default_account_subdomain
			@current_account.save
		end
		@current_account
	end

	def http_protocol( use_ssl = request.ssl? )
		(use_ssl ? "https://" : "http://")
	end 

	def current_stylesheet 
		@current_stylesheet = "/domains/#{account_subdomain}/stylesheets/frontend.css"
	end
end