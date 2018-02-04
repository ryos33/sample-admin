module ApplicationHelper
  def current_admin_nickname
    (admin_signed_in? ? current_admin.nickname : Settings.cmn.guest_name)
  end

  def site_name
    Settings.cmn.site_name
  end

  def image_path
    Settings.cmn.image_path
  end

  def head_title(page_title)
    site_title = Settings.cmn.site_title_head
    if page_title.empty?
      site_title
    else
      "#{page_title} | #{site_title}"
    end
  end

  def body_title(page_title)
    site_title = Settings.cmn.site_title_body
    if page_title.empty?
      site_title
    else
      page_title
    end
  end

  def currency_format(currency)
    t('view.common.currency_format') % currency.to_s(:delimited)
  end
end
