Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # app/views/以下に置かれたlayouts以外のディレクトリを対象とし、Routingに追加
  exclude_dir = ["layouts"]
  anonymous_dir = []
  Dir::glob(File.join(Rails.root.to_s, "/app/views/*/")).map{|f| anonymous_dir << f.split("/").last }

  (anonymous_dir - exclude_dir).each do |dir|
    get "#{dir}" => "anonymous#index", :defaults => {:directory => "#{dir}"}
  end
end
