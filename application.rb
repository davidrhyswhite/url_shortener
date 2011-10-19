class Application < Sinatra::Base

  configure do
    ActiveRecord::Base.establish_connection(
      :adapter  => 'sqlite3',
      :database =>  'db/application.sqlite3'
    )
    set :static, true
  end

  get '/' do
    @link = Link.new
    erb :index
  end

  post '/' do
    @link = Link.new :url => params[:url]
    if @link.save
      redirect "/links/#{@link.key}"
    else
      erb :error
    end
  end

  get '/links/:key' do
    @link = Link.find_by_key params[:key]
    erb :success
  end

  get '/*' do |key|
    "#{key}"
  #  if @link = Link.find_by_key key
  #    @link.increment_clicks
  #    redirect @link.url
  #  else
  #    raise Sinatra::NotFound
  #  end
  end
end