# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_client_account?
    account_subdomain != default_account_subdomain
  end
  
  def is_main_layout?
    account_subdomain == default_account_subdomain
  end

  def auto_page_parts
    render :partial => "shared/auto_page_parts"
  end
  
  def firm_page_parts
    render :partial => "shared/firm_page_parts"
  end
  
  def app_page_parts
    render :partial => "shared/app_page_parts"
  end
  
  def account_url_for( url_hash, account_subdomain = default_account_subdomain, use_ssl = request.ssl?)
		account_url(account_subdomain, use_ssl) + url_for(url_hash)
	end

  # These Are for the PicNik API

  def picnik_edit_url(image_url, export_param, export_url)
    host_name = 'none yet'
    params = {
      :import => image_url,
      :export => export_url,
      :export_field => export_param,
      :apikey => '615f63085706666dba4cebec2ef7072c',
      :close_target => export_url,
      :export_agent => 'browser',
      :out_format => 'png',
      :export_title => "Save and return to #{host_name}",
      :exclude => 'in,create',
      :host_name => host_name
    }
    "http://www.picnik.com/service/?#{escape_picnik_params(params)}"
  end

  def escape_picnik_params(params)
    params.map { |k,v| 
      "_#{strict_escape(k)}=#{strict_escape(v)}"
      }.join("&")
    end

    def strict_escape(s)
      # escape spaces as %20; picnik won't accept +
      CGI.escape(s.to_s).gsub("+", "%20")
    end


  end
