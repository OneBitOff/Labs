file '/var/tmp/testfile' do
  owner 'danielneff'
  group 'danielneff'
  mode  '777'
  content "First recipes in chef\n"
  action :create
end
