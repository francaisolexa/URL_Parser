class UrlParser
  def initialize(url)
    @url = url
    @after_scheme = @url.split('://')[1]
  end

  def scheme
    @url.split('://')[0]
    @scheme = @url.split('://')[0]
  end

  def domain
    if @after_scheme.include? ":"
      @after_scheme.split(':')[0]
    else 
      @after_scheme.split('/')[0]
    end
  end

  def port
    prt = ""

    if @after_scheme.include? ":"
      prt = @after_scheme.split(':')[1]
      if prt.include? "/"
        prt = prt.split('/')[0]
      end
    elsif scheme == "http"
      "80"
    # else scheme == "https"
    #   "443"
    end

    # if @scheme == "http" && prt == ""
    #   prt = 80
    # end

    # if prt.include? "/"
      # prt = prt.split('/')[0]
    # end

    # if @after_scheme.!include? prt
      # return 80
    # end
  end

  def path
    if @after_scheme.include? '?'
      pth = @after_scheme.split('?')[0]
    end
    if pth.include? ('/')
      pth.split('/')[1]
    end
  end

  def query_string
    if @after_scheme.include? '?'
      qry = @after_scheme.split('?')[1]
    end
    if qry.include? '#'
      qry = qry.split('#')[0]
    end

    query_hash = {}
    qry_array = qry.split("&")
    qry_array.each do |el|
    query1 = el.split("=")[0]
    query2 = el.split("=")[1]
    query_hash[query1] = query2
    end
    query_hash
  end

  def fragment_id
    @url.split('#').last
  end
end

@url = UrlParser.new('http://www.google.com/search?q=cat&name=Tim#img=FunnyCat')
# @url = UrlParser.new('http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat')

 # p @url