directory '/var/tmp/newdir' do
  owner 'root'
  group 'root'
  mode  '777'
  action :create
end

file '/var/tmp/newdir/test' do
  mode '777'
  content "This is working\n"
  action :create
end
