class UrlParser
  def initialize(url)
    @url = url
    @after_scheme = @url.split('://')[1]
    @after_domain = @after_scheme.split(':')[1]
    @after_port = @after_domain.split('/')[1]
    @after_path = @after_port.split('?')[1]
  end

  def scheme
    @url.split('://')[0]
  end

  def domain
    if @after_scheme.include? ":"
      @after_scheme.split(':')[0]
    else 
      @after_scheme.split('/')[0]
    end
  end

  def port
    @after_domain.split('/')[0]
  end

  def path
    if @after_port.include? '?'
      this_path = @after_port.split('?')[0]
    elsif @after_port.include? '#'
      this_path = @after_port.split('#')[0]
    end


    if this_path == ""
      return nil
      

  end

def query_string
  query_hash = {}
  if @after_path.include? '#'
    qry = @after_path.split('#')[0]
  end
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

@url = UrlParser.new('http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat')
# @url = UrlParser.new('https://www.google.com/?q=cat#img=FunnyCat')
end