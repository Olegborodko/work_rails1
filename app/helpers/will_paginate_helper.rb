module WillPaginateHelper
  class WillPaginateAjaxLinkRenderer < WillPaginate::ActionView::LinkRenderer
    def prepare(collection, options, template)
      options[:params] ||= {}
      options[:params]["_"] = nil
      super(collection, options, template)
    end

    protected


    def link(text, target, attributes = {})
      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
      end

      
      a=target
      a1=a.rindex('/')
      a2=a.rindex('?')
      #p target

      if (a[a1+1..a2-1]).match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/)
        target=a[0..a1]+a[a2..a.length]
      end

      #Float(a[a1+1..a2-1]) != nil rescue false

      #p a[0..a1]+a[a2..a.length]


      ajax_call = "$.ajax({url: '#{target}', dataType: 'script'});"
      @template.link_to_function(text.to_s.html_safe, ajax_call, attributes)
    end
  end

  def ajax_will_paginate(collection, options = {})
     
    will_paginate(collection, options.merge(:renderer => WillPaginateHelper::WillPaginateAjaxLinkRenderer))
  end
end