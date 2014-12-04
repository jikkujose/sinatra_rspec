class TodoAPI < Sinatra::Base
  get '/' do
    $db.join('\n')
  end

  post '/' do
    halt 400 unless params[:todo]
    $db << params[:todo]
  end
end
